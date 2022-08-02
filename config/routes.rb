Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      post 'subscribe', to: 'subscriptions#create'


    end 
  end 
end
