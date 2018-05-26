Rails.application.routes.draw do
  devise_for :users
  resources :performances do
    resources :reservations, only: [:new, :create]
  end

  resources :reservations, only: [:edit, :update]

  resources :pages, only: [:index]
    root to: 'pages#home'
    get "dashboard", to: "pages#dashboard"
    get "dashboard/my_reservations", to: 'pages#reservation_as_client', as: "my_reservations"
    get "dashboard/my_reservations_requests", to: 'pages#reservation_as_performer', as: "my_reservations_requests"
    get "dashboard/my_performances", to: 'pages#my_performances', as: "my_performances"
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
