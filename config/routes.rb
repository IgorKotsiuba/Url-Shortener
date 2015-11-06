Rails.application.routes.draw do
  get 'home/index'
  devise_for :users
  resources :links
  get ':short' => 'links#display_url'

  authenticated :user do
    root 'links#index', as: 'authenticated_root'
  end
  root 'home#index'
  get 'paypal/checkout', to: 'subscriptions#paypal_checkout'
end
