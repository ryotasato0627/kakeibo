Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  resources :posts do
    resources :books, only: [:create, :destroy, :edit, :update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
