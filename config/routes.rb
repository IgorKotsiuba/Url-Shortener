Rails.application.routes.draw do
  get 'home/index'
  devise_for :users
  resources :links
  get ':short' => 'links#display_url'
  root 'home#index'
  get 'paypal/checkout', to: 'subscriptions#paypal_checkout'
  resources :subscriptions
  resources :plans
end
