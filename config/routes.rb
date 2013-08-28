MentorPairing::Application.routes.draw do
  get "/activations/:code/mentor", :to => "activations#mentor"
  root :to => "availabilities#index"

  resources :availabilities
  resources :users
  resources :appointments
end
