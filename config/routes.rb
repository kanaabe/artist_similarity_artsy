Rails.application.routes.draw do
  root 'home#index'
  post '/results', to: 'home#search'
  get '/show', to: 'home#show'
  post '/gamesetup', to: 'home#gamesetup'
  get '/game', to: 'home#game'
  #resources :home
end
