Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  root "articles#index"
  # get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  get "/articles", to: "articles#index"
  get "/articles/", to: "articles#show"
  get "/articles/new", to: "articles#new"
  resources :articles
  resources :articles do
    resources :comments
    post "article/navya", to: 'articles#create'
end
end
