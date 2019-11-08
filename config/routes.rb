Rails.application.routes.draw do
  resources :bloggers, only: [:new, :create, :index, :show]
  resources :destinations, only: [:show, :index, :edit, :update]
  resources :posts, only: [:show, :new, :create, :edit, :update]
end
