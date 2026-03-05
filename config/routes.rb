Rails.application.routes.draw do
  resource :profile, only: [ :edit, :update ] do
    patch :password, on: :collection, to: "profiles#update_password"
  end
  resource :two_factor_settings, only: [ :new, :create, :destroy ]
  resource :registration, only: [ :new, :create ]
  resource :session, only: [ :new, :create, :destroy ] do
    collection do
      get :two_factor
      post :two_factor
    end
  end
  resources :passwords, param: :token
  root "tools#index"
  resources :tools, only: [ :index, :show, :destroy ] do
    member do
      patch :spotlight
    end
    resource :favorite, only: [ :create, :destroy ]
    resources :reviews, only: [ :create, :destroy ]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
end
