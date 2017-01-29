Rails.application.routes.draw do
  root "users#index"

  resources :users, :only => [:index, :edit, :update]

  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

  # devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
