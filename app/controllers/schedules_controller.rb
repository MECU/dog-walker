class SchedulesController < ApplicationController
  def show
    @date = params[:date]

    @manager = true
  end

  def home
    @dogs = Schedule.where(schedule_date: params[:date]).where(status: 'home').includes(:dog)
    if params[:walker_id]
      @dogs = @dogs.where(walker_id: params[:walker_id])
    else
      @manager = true
    end

    render partial: 'status', locals: { status: 'home' }
  end

  def arriving
    @dogs = Schedule.where(schedule_date: params[:date]).where(status: 'arriving').includes(:dog)
    @dogs = @dogs.where(walker_id: params[:walker_id]) if params[:walker_id]

    render partial: 'status', locals: { status: 'arriving' }
  end

  def playing
    @dogs = Schedule.where(schedule_date: params[:date]).where(status: 'playing').includes(:dog)
    @dogs = @dogs.where(walker_id: params[:walker_id]) if params[:walker_id]

    render partial: 'status', locals: { status: 'playing' }
  end

  def leaving
    @dogs = Schedule.where(schedule_date: params[:date]).where(status: 'leaving').includes(:dog)
    @dogs = @dogs.where(walker_id: params[:walker_id]) if params[:walker_id]

    render partial: 'status', locals: { status: 'leaving' }
  end

  def done
    @dogs = Schedule.where(schedule_date: params[:date]).where(status: 'done').includes(:dog)
    @dogs = @dogs.where(walker_id: params[:walker_id]) if params[:walker_id]

    render partial: 'status', locals: { status: 'done' }
  end

  def update
    params.require([:dog, :status])
    schedule = Schedule.where(id: params[:dog]).update!(status: params[:status])

    # Update this status and previous status
    streams = []
    streams.append(update_display(schedule.first.schedule_date, params[:status], schedule.first.walker_id))
    previous_status = Schedule::previous_status(params[:status])
    streams.append(update_display(schedule.first.schedule_date, previous_status, schedule.first.walker_id))

    render turbo_stream: streams
  end

  def update_walker
    params.require([:dog, :walker])
    schedule = Schedule.where(id: params[:dog]).update!(walker_id: params[:walker])
    @manager = true

    render turbo_stream: update_display(schedule.first.schedule_date, schedule.first.status)
  end

  private
  def update_display(schedule_date, status, walker_id=nil)
    @dogs = Schedule.where(schedule_date:).where(status:).includes(:dog)
    @dogs = @dogs.where(walker_id:) if walker_id

    turbo_stream.replace(status,
                         partial: "schedules/status",
                         locals: { status: }
    )
  end
end
