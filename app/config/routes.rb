Rails.application.routes.draw do
  get 'vtubers/index'
  # resources :scflds
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'vtubers#index'
end