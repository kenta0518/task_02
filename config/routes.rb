Rails.application.routes.draw do
  post "posts/reservations/:post_id/new"=>"reservations#create"
  get "posts/reservations/:post_id/new" =>"reservations#new"
  get 'reservations/:id/index' =>"reservations#index"
  get "login" => "users#login_form"
  post "login" => "users#login"
  post "logout" => "users#logout"
  post "users/:id/profile" => "users#compilation"
  get "users/:id/edit" => "users#edit"
  get "users/:id/account" => "users#account"
  get "users/:id/profile" =>"users#profile"
  post'users/create' => 'users#create'
  get "signup" => "users#new"
  get "users/:id/rooms"=>"users#rooms"
  get 'users/index'
  
  
  
  get "posts/search"=>"posts#search"
  post "posts/new" =>"posts#create"
  get "posts/new" =>"posts#new"
  get 'posts/index' =>"posts#index"
  get "posts/:id" =>"posts#show"
  get '/' =>'home#top'
  resources :reservations
  resources :posts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
