Rails.application.routes.draw do
  get 'vtubers/index'
  get 'vtubers/new'
  post 'vtubers' => 'vtubers#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'vtubers#index'
end
