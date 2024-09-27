# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Walker.create!([
                 { name: 'Alice' },
                 { name: 'Bob' },
                 { name: 'Charlie' },
                 { name: 'David' },
                 { name: 'Eve' },
                 { name: 'Frank' },
                 { name: 'Grace' },
                 { name: 'Henry' },
                 { name: 'Isabella' },
                 { name: 'Jack' }
               ])

1000.times do |_|
  Dog.create!(name: "Dog #{SecureRandom.hex(3)}")
end

Dog.all.each do |dog|
  morning = [true, false].sample
  afternoon = [true, false].sample
  morning = true if (!morning && !afternoon)
  full_week = [true, false].sample

  DogSchedule.create!(dog:,
                      monday_morning: morning,
                      monday_afternoon: afternoon,
                      tuesday_morning: morning && full_week,
                      tuesday_afternoon: afternoon && full_week,
                      wednesday_morning: morning,
                      wednesday_afternoon: afternoon,
                      thursday_morning: morning && full_week,
                      thursday_afternoon: afternoon && full_week,
                      friday_morning: morning,
                      friday_afternoon: afternoon,
                      )
end
