Rails.application.routes.draw do
  # devise_for :admin_users, ActiveAdmin::Devise.config
  # ActiveAdmin.routes(self)

  devise_for :users
  post 'user_groups' => 'user_groups#add'
  resources :groups
  resources :users do
  end

  resources :posts, only: [:new, :create, :index, :show, :destroy] do
    collection do
      get 'search'
    end
    resource :checkers, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy, :edit, :show]
  end
  root to: 'homes#about'
  # match '*unmatched_route', to: 'application#raise_not_found!', via: :all
  # get '*path', controller: 'application', action: 'render_404'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
