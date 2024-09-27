# frozen_string_literal: true

require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test 'GET /' do
    fido = dogs(:one)
    max = dogs(:two)
    alice = walkers(:one)
    bob = walkers(:two)
    Schedule.create!(dog: fido, schedule_date: Date.today, morning: true, afternoon: true, status: 'home', walker: alice)
    Schedule.create!(dog: max, schedule_date: Date.today, morning: true, afternoon: true, status: 'playing', walker: bob)

    get root_url
    assert_response :success
    assert_includes @response.body, alice.name
    assert_includes @response.body, bob.name
    assert_includes @response.body, 'Schedule'
  end
end
