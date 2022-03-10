Rails.application.routes.draw do
  resources :experiences do
    member do
      post :mark_as_helpful
      post :mark_as_not_helpful
    end
    collection do
      get 'search'
    end
  end
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/profile" => "profile#index"
  root to: 'home#index'
end
