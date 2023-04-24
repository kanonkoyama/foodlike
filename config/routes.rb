Rails.application.routes.draw do
  devise_for :users, :controllers =>{
    :confirmations => "users/confirmations",
    :registrations => "users/registrations",
    :sessions => "users/sessions",
    :passwords => "users/passwords"
  }
  devise_scope :user do
    get "users/:id/like", to: "users/sessions#like"
    get "users/:id/edit", to: "devise/registrations#edit"
    get "users/:id", to: "users/sessions#show"
  end

  post "contacts/create" => "contacts#create"
  get 'contacts/new' => "contacts#new"
  get 'contacts/index' => "contacts#index"

  post "likes/:post_id/create" => "likes#create"
  post "likes/:post_id/destroy" => "likes#destroy"

  post "posts/:id/destroy" => "posts#destroy"
  post "posts/update" => "posts#update"
  post "posts/create" => "posts#create"
  get "posts/new" => "posts#new"
  get 'posts/index' => "posts#index"
  get "posts/:id/destroy" => "posts#destroy_confirmation"
  get "posts/:id/edit" => "posts#edit"
  get "posts/:id" => "posts#show"
  

  get '/' => "home#top"
  get '/about' => "home#about"

    # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "posts#index"
end
