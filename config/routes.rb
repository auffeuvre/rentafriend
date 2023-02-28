Rails.application.routes.draw do
devise_for :users
# devise_scope :user do
#   get 'login', to: 'users/sessions#new'
#   get 'signup', to: 'users/registrations#new'

# end

  resources :users, only: [:show, :edit, :update]
  root to: "activities#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :activities do
    resources :bookings, only: [:new, :create, :update]
  end

  get "/myactivities", to: "activities#myactivities", as: "myactivities"
  get "/mybookings", to: "bookings#mybookings", as: "mybookings"

  get '/myprofile', to: 'users#myprofile'


end
