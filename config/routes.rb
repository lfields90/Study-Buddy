Rails.application.routes.draw do
  root "spots#index"
  devise_for :users

  resources :spots do
    resources :reviews, only: [:new, :create]
  end
end
