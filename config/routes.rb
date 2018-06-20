Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"
  post '/user_token' => 'user_token#create'
  post '/users' => 'users#create'
  namespace :api do
    #Problems Controller
    get '/problems' =>'problems#index'
    get '/problems/:id' => 'problems#show'
    post '/problems' => 'problems#create'
    patch '/problems/:id' => 'problems#update'
    delete '/problems/:id' => 'problems#destroy'

    #Scores Controller
    get '/scores' =>'scores#index'
    get '/scores/:id' => 'scores#show'
    patch '/scores/:id' => 'scores#update'
    delete '/scores/:id' => 'scores#destroy'
  end
end
