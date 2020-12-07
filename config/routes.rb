Rails.application.routes.draw do

  devise_for :users
  root 'home#home'
  get 'contact', to: 'home#contact'
  resources :selections

end
