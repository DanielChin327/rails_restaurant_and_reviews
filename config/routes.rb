Rails.application.routes.draw do

  resources :restaurants do
    resources :reviews, only: [:new, :create]
    # This makes reviews need a restaurants to implment a new and create

    # Add routes that relate to restaurants here:
    collection do
      # Custom Index
      # /restaurants/custom_word

      get :top
      # get :top is the same as #get "/restaurants/top", to: "restaurants#top"
    end

    member do
      # Custom Show
      # /restaurants/:id/custom_word

      get :chef
      # get :chef is the same as #get "restaurants/:id/chef", to: "restaurants#chef"
    end

    # collection vs member -> many vs one.
  end


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "restaurants#index"
end
