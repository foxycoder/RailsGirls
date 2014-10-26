Rails.application.routes.draw do
  devise_for :users
  resources :posts do
    member do
      post :comment
      put :publish
    end
  end
  root to: "posts#index"
end
