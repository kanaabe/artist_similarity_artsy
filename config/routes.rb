Rails.application.routes.draw do
  root 'home#index'
  post '/results', to: 'home#search'
  get '/show', to: 'home#show'
  post '/game', to: 'home#game'
  #resources :home
end
