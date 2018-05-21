Rails.application.routes.draw do
  get 'rails/destroy'
  get 'rails/Reservation'
  get 'rails/destroy'
  get 'rails/Performance'
  devise_for :users
  root to: 'pages#home'
  resources :performances
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
