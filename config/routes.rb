Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :performances do
    resources :reservations, only: [:new, :create]
  end

  resources :reservations, only: [:edit, :update]
    get "dashboard", to: 'reservations#index', as: "reservations"
    get "dashboard/my_reservations", to: 'reservations#reservation_as_client', as: "my_reservations"
    get "dashboard/my_reservations_requests", to: 'reservations#reservation_as_performer', as: "my_reservations_requests"
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
