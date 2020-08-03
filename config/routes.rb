Rails.application.routes.draw do
  resources :books
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'hello/index', to: 'hello#index'
  get 'hello/view'
  get 'hello/list'
  get 'record/find'
  get 'record/find_by'
  get 'record/page(/:id)', to: 'record#page'
  get 'record/last'
  get 'record/groupby'
end
