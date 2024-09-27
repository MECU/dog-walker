# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  get '/schedule/:date', to: 'schedules#show', as: 'schedule'
  get '/schedule/:date/status', to: 'schedules#status', as: 'schedule_status'

  post '/schedule/update/status', to: 'schedules#update', as: 'schedule_update'
  post '/schedule/update/walker', to: 'schedules#update_walker', as: 'schedule_update_walker'
end
