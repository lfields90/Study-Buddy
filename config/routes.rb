Rails.application.routes.draw do
  root "spots#index"
  devise_for :users

  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]
  resources :spots, only: [:index, :new, :create]

  resources :spots do
    resources :reviews, only: [:new, :create]
  end
end
