Rails.application.routes.draw do
  resources :vtubers, only: [:index, :new, :create, :show, :destroy, :upadte, :edit]
  root 'vtubers#index'
end
