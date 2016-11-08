Rails.application.routes.draw do
  post "/rate" => "rater#create", :as => "rate"
  mount Ckeditor::Engine => "/ckeditor"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root "books#index"
  resources :phones
  resources :users, only: [:show, :edit, :update]

  namespace :admin do
    root "dashboard#index", as: :root
    resources :users
    resources :categories
    resources :phones
  end
end
