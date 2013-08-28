MentorPairing::Application.routes.draw do
  get "/activations/:code/mentor", :to => "activations#mentor"

  resources :availabilities
  resources :users
end
