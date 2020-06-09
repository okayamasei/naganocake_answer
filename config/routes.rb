Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "public/items#top"
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
  }
  namespace :admin do
    resources :top, only: [:index]
    resources :end_users, only: [:index, :show, :edit, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :orders, only: [:index, :show, :update]
    resources :order_items, only: [:update]
  end
  devise_for :end_users, controllers: {
    sessions: 'end_users/sessions',
    registrations: 'end_users/registrations',
  }
  scope module: :public do
    get '/' => "items#top"
    resources :items, only: [:top, :index, :show]
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

    get 'orders/new'
    post 'orders/confirm'
    get 'orders/index'
    get 'orders/show'
    post 'orders/create'
    get 'orders/complete'
  end
end
