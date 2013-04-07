Yardbase::Application.routes.draw do
  resources :tags, only: [:index, :show]
  resources :things, only: [:index, :show]

  authenticated :user do
    root :to => 'home#index'
    resources :tags
    resources :things
  end

  root :to => "home#index"
  ActiveAdmin.routes(self)
  devise_for :users, ActiveAdmin::Devise.config
end
