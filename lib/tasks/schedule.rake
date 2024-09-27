namespace :schedule do
  desc "Create schedule for today"
  task load: :environment do
    # Hardcoding the date for today, ideally a param passed in
    today = '2024-09-26'

    created = 0
    dogs = DogSchedule.where(thursday_morning: true).or(DogSchedule.where(thursday_afternoon: true))
    dogs.each do |schedule|
      break if created >= 120 # Limit to 120 schedules
      Schedule.create!(dog: schedule.dog,
                       schedule_date: today,
                       morning: schedule.thursday_morning,
                       afternoon: schedule.thursday_afternoon,
                       status: 'home'
      )
      created += 1
    end

    puts "Created #{created} out of #{dogs.count} schedules for today"
  end
end
