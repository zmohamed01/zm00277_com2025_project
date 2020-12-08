Rails.application.routes.draw do

  devise_for :users
  root 'home#home'
  get 'contact', to: 'home#contact'
  get 'courses', to:'courses#courses'
  get 'search_courses', to: 'courses#search_courses'
  resources :selections

end
