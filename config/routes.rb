Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # admin space
  namespace :admin do
    resources :posts
    root to: 'posts#index'
  end

  # user space
  resources :posts, only: %i[index show] # or simply [index show]

  root to: "posts#index"
end
