class SchedulesController < ApplicationController
  def show
    @schedules = Schedule.where(schedule_date: params[:date])
    @date = '2024-09-26'
  end

  def home
    @dogs = Schedule.where(schedule_date: params[:date]).where(status: 'home')
    render partial: 'status', locals: { status: 'home' }
  end

  def arriving
    @dogs = Schedule.where(schedule_date: params[:date]).where(status: 'arriving')
    render partial: 'status', locals: { status: 'arriving' }
  end

  def playing
    @dogs = Schedule.where(schedule_date: params[:date]).where(status: 'playing')
    render partial: 'status', locals: { status: 'playing' }
  end

  def leaving
    @dogs = Schedule.where(schedule_date: params[:date]).where(status: 'leaving')
    render partial: 'status', locals: { status: 'leaving' }
  end

  def done
    @dogs = Schedule.where(schedule_date: params[:date]).where(status: 'done')
    render partial: 'status', locals: { status: 'done' }
  end

  def update
    params.require([:dog, :status])
    schedule = Schedule.where(id: params[:dog]).update!(status: params[:status])

    # Update this status and previous status
    streams = []
    streams.append(update_display(schedule.first.schedule_date, params[:status]))
    previous_status = Schedule::previous_status(params[:status])
    streams.append(update_display(schedule.first.schedule_date, previous_status))

    render turbo_stream: streams
  end

  private
  def update_display(schedule_date, status)
    @dogs = Schedule.where(schedule_date:).where(status:)
    turbo_stream.replace(status,
                         partial: "schedules/status",
                         locals: { status: }
    )
  end
end
