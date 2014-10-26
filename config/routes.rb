Rails.application.routes.draw do
  devise_for :users
  resources :posts do
    member do
      post :comment
    end
  end
  root to: "posts#index"
end
