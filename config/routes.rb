Rails.application.routes.draw do

  root 'scouts#index'
  post '/' => 'scouts#index'
  get 'new' => 'scouts#new'
  get 'scout/:id' => 'scouts#show', as: :scout_show
  get 'scout/:id/edit' => 'scouts#edit', as: :scout_edit
  resources :scouts

  #devise_for :users
  #root 'users#index'
  get '/about' => 'static_pages#about', as: :about
  get '/help' => 'static_pages#help', as: :help
  get '/contact' => 'static_pages#contact', as: :contact
  get '/news' => 'static_pages#news', as: :news
  #get '/show/:id' => 'users#show', as: :users_show
  #get '/signup' => 'users#new',as: :signup
  #post '/signup' => 'users#create'


  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'   
  } 

  devise_scope :user do
    get "user/:id"  =>  "users/registrations#detail", as: :user_detail
    get "users/signup"  =>  "users/registrations#new",as: :signup
    get "users/login" => "users/sessions#new", as: :login
    get "users/logout"  =>  "users/sessions#destroy", as: :logout
  end

  resources :users do
    resource :scouts
  end

end
