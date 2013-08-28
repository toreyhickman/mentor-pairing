MentorPairing::Application.routes.draw do
  get "/activations/:code/user", :to => "activations#user"
  get "/appointments/:code/create", :to => "appointments#create"
  root :to => "availabilities#index"

  resources :availabilities
  resources :users
  resources :appointment_requests
end
