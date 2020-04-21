Rails.application.routes.draw do
  
  devise_for :users
  resources :workers, only:[:new, :create]
  resources :tasks, only:[:index, :new, :create]
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "application#hello"
  get 'profile_pages/main'
end
