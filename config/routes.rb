Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "pages#home"
  resources :users
  resources :notes
  resources :followings, only: [:create, :destroy]
  resources :likes, only: [:create, :destroy]
end
