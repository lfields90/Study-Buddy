Rails.application.routes.draw do
  root "spots#index"
  devise_for :users

  resources :spots, only: [:index, :new, :create, :show] do
    resources :reviews, only: [:new, :create, :update, :edit]
  end
end
