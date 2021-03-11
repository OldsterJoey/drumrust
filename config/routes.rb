Rails.application.routes.draw do
  get 'user_profile/show'
  get 'user_profile/edit', to: 'user_profile#edit', as: 'user_profile'
  patch 'user_profile/edit', to: 'user_profile#update'
  devise_for :users
  root to: "pages#home"
  resources :products
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
