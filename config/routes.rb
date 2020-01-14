Rails.application.routes.draw do
  devise_for :users
  root to: "pages#index" 

  resources :billboards
  resources :artists
  resources :songs

end
