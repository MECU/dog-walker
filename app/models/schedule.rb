class Schedule < ApplicationRecord
  belongs_to :dog
  has_one :walker

  STATUS = %w[home arriving playing leaving done].freeze

  def self.previous_status(status)
    Schedule::STATUS[Schedule::STATUS.find_index(status) - 1]
  end

  def self.next_status(status)
    Schedule::STATUS[Schedule::STATUS.find_index(status) + 1]
  end
end
