Rails.application.routes.draw do
  resources :vtubers, only: [:index, :new, :create, :show, :destroy, :upadte, :edit, :update]
  root 'vtubers#index'
end
