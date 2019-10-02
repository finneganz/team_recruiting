Rails.application.routes.draw do
  root 'users#show'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  

end
