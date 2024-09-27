require 'test_helper'

class SchedulesControllerTest < ActionDispatch::IntegrationTest
  test 'GET /schedule/:date' do
    get schedule_url(date: Date.today)
    assert_response :success
  end

  # GET /schedule/:date/status
  test 'response has the dogs in correct status' do
    fido = dogs(:one)
    max = dogs(:two)
    walker = walkers(:one)
    Schedule.create!(dog: fido, schedule_date: Date.today, morning: true, afternoon: true, status: 'home', walker:)
    Schedule.create!(dog: max, schedule_date: Date.today, morning: true, afternoon: true, status: 'playing', walker:)

    get schedule_status_url(date: Date.today, status: 'home')
    assert_response :success
    assert_includes @response.body, fido.name
    assert_not_includes @response.body, max.name
  end

  # POST /schedule/update/status
  test 'updates the dog status correctly' do
    fido = dogs(:one)
    max = dogs(:two)
    walker = walkers(:one)
    s = Schedule.create!(dog: fido, schedule_date: Date.today, morning: true, afternoon: true, status: 'home', walker:)
    Schedule.create!(dog: max, schedule_date: Date.today, morning: true, afternoon: true, status: 'playing', walker:)

    post schedule_update_url(dog: s, status: 'arriving', format: :turbo_stream)
    assert_includes @response.body, fido.name
    assert_not_includes @response.body, max.name
  end

  # POST /schedule/update/walker
  test 'updates the dog walker correctly' do
    fido = dogs(:one)
    max = dogs(:two)
    walker = walkers(:one)
    bob = walkers(:two)
    s = Schedule.create!(dog: fido, schedule_date: Date.today, morning: true, afternoon: true, status: 'home', walker:)
    Schedule.create!(dog: max, schedule_date: Date.today, morning: true, afternoon: true, status: 'playing', walker:)

    post schedule_update_walker_url(dog: s, walker: bob, format: :turbo_stream)
    assert_includes @response.body, fido.name
    assert_includes @response.body, bob.name
    assert_includes @response.body, walker.name
    assert_not_includes @response.body, max.name
  end
end
