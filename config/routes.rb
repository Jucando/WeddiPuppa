Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "/pages/:page" => "pages#show"
  resources :performances do
    resources :reservations, only: [:new, :create]
  end
  resources :reservations, only: [:index]
end
