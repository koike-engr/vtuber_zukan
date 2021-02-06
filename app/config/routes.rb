Rails.application.routes.draw do
  resources :vtubers, only: [:index, :new, :create, :show, :destroy, :update, :edit] do
    resources :videos, only: [:index]
  end
  root 'vtubers#index'
end
