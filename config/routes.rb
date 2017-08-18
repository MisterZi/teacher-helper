Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'

  resources :posts do
    resources :comments, only: [:create, :edit, :destroy]
  end

  resources :users do
    member do
      get :update_state
    end

  end

end
