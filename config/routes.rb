BodyStatus::Application.routes.draw do
  root :to => 'users#index'
  resources :users, :except => [:delete]
end
