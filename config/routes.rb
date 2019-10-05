Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  get '/show/:id' => 'users#show', as: :users_show
  get '/signup' => 'users#new',as: :signup
  post '/signup' => 'users#create'
  resources :users

end
