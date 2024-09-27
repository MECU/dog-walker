Rails.application.routes.draw do
  root "home#index"

  get '/walkers/:id', to: 'walkers#show', as: 'walker'
  get '/schedule/:date', to: 'schedules#show', as: 'schedule'

end
