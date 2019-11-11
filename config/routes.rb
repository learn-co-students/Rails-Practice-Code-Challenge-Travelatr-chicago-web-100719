Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :bloggers, only: [:show, :new, :create]
  resources :posts, only: [:new, :create, :edit, :update, :show]
  post '/posts/:id', to: 'posts#like', as: 'like_post'
  resources :destinations
end
