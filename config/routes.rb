Weeds::Application.routes.draw do
  resources :orders do
    resources :order_items
  end

  resources :order_items

  resources :images, :only => [:destroy, :new, :create]


  devise_for :users
 # resources :pricings

  resources :sections do
    resources :items
  end

  resources :items do
    member do
     get 'create_special'
    end
  end

  #NonResourceful Routes
  get 'ajax/fb_like'

  root 'sections#index'

  #---------TEST---------------
  get "facebook_plugin", :to => 'tests#facebook_plugin'
  get "google_calendar", :to => 'tests#google_calendar'

end
