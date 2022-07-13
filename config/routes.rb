Rails.application.routes.draw do
  resources :tasks do
    member do
      get 'search', to: 'tasks#search'
    end
  end
  root 'tasks#index'
  resources :ints
  resources :labels
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
