Rails.application.routes.draw do
  root to: "public/items#top"
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
  }
  namespace :admin do
    resources :top, only: [:index]
  end
  devise_for :end_users, path: :public, controllers: {
    sessions: 'end_users/sessions',
    registrations: 'end_users/registrations',
  }
  namespace :public do
    get '/' => "items#top"
    resources :items, only: [:index]
  end
end
