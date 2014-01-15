Weeds::Application.routes.draw do

  resources :orders do
    resources :order_items
  end

  resources :order_items


  devise_for :users
 # resources :pricings

  resources :sections do
    resources :items
  end

  resources :items

  root 'sections#index'
end
