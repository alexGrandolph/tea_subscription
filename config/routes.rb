Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      post 'subscribe', to: 'customers/subscriptions#create'
      post 'subscriptions/cancel', to: 'customers/subscriptions#update'
      get 'customer/subscriptions', to: 'customers/subscriptions#index'
    end 
  end 
end
