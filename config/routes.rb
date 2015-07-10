Rails.application.routes.draw do
  root "homes#index"
  devise_for :users

  resources :spots do
    resources :reviews, except: [:index, :show] do
      member do
        patch 'upvote'
        patch 'downvote'
      end
    end
  end

  resources :votes, only: [:create, :destroy]
  resources :users, only: [:index, :destroy]

  as :user do
    get 'spots', to: 'spots_path', as: :user_root
  end
end
