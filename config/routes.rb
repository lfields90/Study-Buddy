Rails.application.routes.draw do
  root "spots#index"
  devise_for :users

  resources :spots do
    resources :reviews, only: [:new, :create] do
      member do
        patch 'upvote'
        patch 'downvote'
      end
    end
  end
end
