class Schedule < ApplicationRecord
  belongs_to :dog

  STATUS = %i[home arriving play leaving done].freeze
end
