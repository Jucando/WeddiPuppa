Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "dashboard" => "pages#dashboard"
  resources :performances do
    resources :reservations, only: [:new, :create]
  end

  resources :reservations, only: [:index, :edit, :update]
end
