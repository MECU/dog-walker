# frozen_string_literal: true

namespace :schedule do
  desc 'Create schedule for today'
  task create: :environment do
    # Default the date for today, ideally a param passed in
    today = Date.today

    walkers = Walker.pluck(:id)

    created = 0
    dogs = DogSchedule.where(thursday_morning: true).or(DogSchedule.where(thursday_afternoon: true))
    dogs.each do |schedule|
      break if created >= 120 # Limit to 120 schedules

      walker = walkers.sample

      Schedule.create!(dog: schedule.dog,
                       schedule_date: today,
                       morning: schedule.thursday_morning,
                       afternoon: schedule.thursday_afternoon,
                       status: 'home',
                       walker_id: walker)

      # If the walker has 12 dogs now, remove from the availability list
      count = Schedule.where(walker_id: walker).where(schedule_date: today).count
      walkers.delete(walker) if count >= 12

      created += 1
    end

    puts "Created #{created} out of #{dogs.count} schedules for today"
  end
end
