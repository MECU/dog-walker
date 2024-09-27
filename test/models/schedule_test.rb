# frozen_string_literal: true

require 'test_helper'

class ScheduleTest < ActiveSupport::TestCase
  test 'previous status' do
    assert_equal 'leaving', Schedule.previous_status('done')
    assert_equal 'playing', Schedule.previous_status('leaving')
    assert_equal 'arriving', Schedule.previous_status('playing')
    assert_equal 'home', Schedule.previous_status('arriving')
  end

  test 'next status' do
    assert_equal 'arriving', Schedule.next_status('home')
    assert_equal 'playing', Schedule.next_status('arriving')
    assert_equal 'leaving', Schedule.next_status('playing')
    assert_equal 'done', Schedule.next_status('leaving')
  end
end
