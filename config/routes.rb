Rails.application.routes.draw do
  resources :experiences
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/profile" => "profile#index"
  root to: 'home#index'
end
