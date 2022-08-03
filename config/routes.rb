Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      post 'subscribe', to: 'subscriptions#create'
      post 'subscriptions/cancel', to: 'subscriptions#update'
      get 'customer/subscriptions', to: 'customers/subscriptions#index'
    end 
  end 
end
