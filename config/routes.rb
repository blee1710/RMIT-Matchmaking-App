Rails.application.routes.draw do
  get 'profile_pages/main'
  devise_for :users
  resources :workers, only:[:new, :create]
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "application#hello"
end
