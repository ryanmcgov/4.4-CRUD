Rails.application.routes.draw do
  root 'home#index'
  resources :albums, except: [:show, :edit, :update, :destroy]
end
