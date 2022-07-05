Rails.application.routes.draw do
  resources :ints
  resources :labels
  resources :tasks
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
