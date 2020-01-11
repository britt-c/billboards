Rails.application.routes.draw do
  root to: "pages#index" 

  resources :billboards
  resources :artists
  resources :songs

end
