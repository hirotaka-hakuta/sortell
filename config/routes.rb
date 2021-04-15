Rails.application.routes.draw do
  # devise_for :admin_users, ActiveAdmin::Devise.config
  # ActiveAdmin.routes(self)

  devise_for :users
  
  root to: 'posts#index'
  resources :posts, only: [:new, :create, :index, :show, :destroy] do
    resource :checkers, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy,:edit,:show]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
