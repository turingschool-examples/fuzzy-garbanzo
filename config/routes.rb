Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :flights, only: [:index]

  delete "/flights/:flight_id/passangers/:passanger_id", to: "flight_passangers#destroy"

  resources :airlines, only: [:show]
end
