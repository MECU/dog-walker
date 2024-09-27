class Dog < ApplicationRecord
  has_one :schedule
  # has_one :owner
  has_many :dog_schedules

end
