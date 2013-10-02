MentorPairing::Application.routes.draw do
  get "/activations/:code/user", :to => "activations#user"
  get "/appointments/:code/create", :to => "appointments#create"
  post "/users/findmentor", :to => "users#find_mentor"
  root :to => "availabilities#index"

  resources :availabilities
  resources :users
  resources :appointment_requests
end
