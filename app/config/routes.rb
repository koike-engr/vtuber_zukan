Rails.application.routes.draw do
  resources :vtubers, only: [:index, :new, :create, :show, :destroy, :update, :edit]
  root 'vtubers#index'
end
