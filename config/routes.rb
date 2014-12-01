Rails.application.routes.draw do
  root 'home#index'
  post '/search', to: 'home#search'
  get '/show', to: 'home#show'
  #resources :home
end
