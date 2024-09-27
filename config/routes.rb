Rails.application.routes.draw do
  root "home#index"

  get '/walkers/:id', to: 'walkers#show', as: 'walker'

  get '/schedule/:date', to: 'schedules#show', as: 'schedule'
  get '/schedule/:date/home', to: 'schedules#home'
  get '/schedule/:date/arriving', to: 'schedules#arriving'
  get '/schedule/:date/playing', to: 'schedules#playing'
  get '/schedule/:date/leaving', to: 'schedules#leaving'
  get '/schedule/:date/done', to: 'schedules#done'

  post '/schedule/updates', to: 'schedules#update'
end
