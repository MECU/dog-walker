class SchedulesController < ApplicationController
  def show
    @schedules = Schedule.where(date: params[:date]).all
  end
end
