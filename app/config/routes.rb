Rails.application.routes.draw do
  resources :vtubers, only: [:index, :new, :create, :show]
  root 'vtubers#index'
end
