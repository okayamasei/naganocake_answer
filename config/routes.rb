Rails.application.routes.draw do
  root to: "public/items#top"
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
  }
  namespace :admin do
    resources :top, only: [:index]
    resources :end_users, only: [:index, :show, :edit, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
  end
  devise_for :end_users, path: :public, controllers: {
    sessions: 'end_users/sessions',
    registrations: 'end_users/registrations',
  }
  namespace :public do
    get '/' => "items#top"
    resources :items, only: [:top, :index, :show]
    # resources :users, only: [:show, :edit, :update, :confirm, :destroy,]
    get 'users/show'
    get 'users/edit'
    patch 'users/update'
    get 'users/confirm'
    delete 'users/destroy'

    get 'cart_items/index'
    post 'cart_items/create'
    patch 'cart_items/update'
    delete 'cart_items/destroy'
    delete 'cart_items/destroy_all'
  end
end
