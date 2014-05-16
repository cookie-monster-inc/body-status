BodyStatus::Application.routes.draw do
  root :to => 'users#index'
  resources :users, :only => [:new, :create, :index]
end
