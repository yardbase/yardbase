Yardbase::Application.routes.draw do
  resources :tags
  resources :things

  ActiveAdmin.routes(self)

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
end
