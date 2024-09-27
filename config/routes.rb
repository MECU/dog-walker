Rails.application.routes.draw do
  root "home#index"

  get '/walkers/:id', to: 'walkers#show', as: 'walker'

  get '/schedule/:date', to: 'schedules#show', as: 'schedule'
  get '/schedule/:date/status', to: 'schedules#status'

  post '/schedule/updates', to: 'schedules#update'
  post '/schedule/update/walker', to: 'schedules#update_walker'
end
