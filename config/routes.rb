Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "public/items#top"
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
  }
  namespace :admin do
    resources :top, only: [:index]
    resources :end_users, only: [:index, :show, :edit, :update]
  end
  devise_for :end_users, controllers: {
    sessions: 'end_users/sessions',
    registrations: 'end_users/registrations',
  }
  scope module: :public do
    get '/' => "items#top"
    resources :items, only: [:index]
    get 'users/show'
    get 'users/edit'
    patch 'users/update'
    get 'users/confirm'
    delete 'users/destroy'
  end
end
