Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :performances do
    resources :reservations, only: [:new, :create]
  end

  resources :reservations, only: [:edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
