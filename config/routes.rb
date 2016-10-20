Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  root "books#index"
  resources :phones

  namespace :admin do
    root "dashboard#index", as: :root
    resources :users, only: [:index, :destroy]
  end
end
