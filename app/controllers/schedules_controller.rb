class SchedulesController < ApplicationController
  def show
    @date = params[:date]

    @manager = true
  end

  def status
    status = params[:status]
    @dogs = Schedule.where(schedule_date: params[:date]).where(status:).includes(:dog)
    if params[:walker_id]
      @dogs = @dogs.where(walker_id: params[:walker_id])
    else
      @manager = true
      @walkers = Walker.all
    end

    render partial: 'status', locals: { status: }
  end

  def update
    params.require([:dog, :status])
    schedule = Schedule.where(id: params[:dog]).update!(status: params[:status])

    if params[:manager]
      @manager = true
      @walkers = Walker.all
    end
    # Update this status and previous status
    streams = []
    streams.append(update_display(schedule.first.schedule_date, params[:status], @manager ? nil : schedule.first.walker_id))
    previous_status = Schedule::previous_status(params[:status])
    streams.append(update_display(schedule.first.schedule_date, previous_status, @manager ? nil : schedule.first.walker_id))

    render turbo_stream: streams
  end

  def update_walker
    params.require([:dog, :walker])
    schedule = Schedule.where(id: params[:dog]).update!(walker_id: params[:walker])
    @manager = true
    @walkers = Walker.all

    render turbo_stream: update_display(schedule.first.schedule_date, schedule.first.status)
  end

  private
  def update_display(schedule_date, status, walker_id=nil)
    @dogs = Schedule.where(schedule_date:).where(status:).includes(:dog, :walker)
    @dogs = @dogs.where(walker_id:) if walker_id

    turbo_stream.replace(status,
                         partial: "schedules/status",
                         locals: { status: }
    )
  end
end
