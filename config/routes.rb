Rails.application.routes.draw do
  root "homes#index"
  devise_for :users

  resources :spots do
    resources :reviews, except: [:index, :show]
  end
  resources :users, only: [:index, :destroy]
end
