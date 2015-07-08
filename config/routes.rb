Rails.application.routes.draw do
  root "spots#index"
  devise_for :users

  resources :spots do
    resources :reviews, except: [:index, :show]
  end
  resources :searches , only: [:index]
end
