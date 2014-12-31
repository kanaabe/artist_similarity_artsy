Rails.application.routes.draw do
  root 'home#index'
  post '/results', to: 'home#search'
  get '/show', to: 'home#show'
  get '/game', to: 'home#game'
  get '/end', to: 'home#end'
  get '/results', to: 'home#results'
end
