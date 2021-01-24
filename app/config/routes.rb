Rails.application.routes.draw do
  resources :vtubers, only: [:index, :new, :create, :show, :destroy]
  root 'vtubers#index'
end
