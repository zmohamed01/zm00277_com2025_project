Rails.application.routes.draw do

  root 'home#home'
  get 'contact', to: 'home#contact'
  resources :selections

end
