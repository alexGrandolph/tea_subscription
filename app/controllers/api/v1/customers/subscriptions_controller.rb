class Api::V1::Customers::SubscriptionsController < ApplicationController

  def index
    customer = Customer.find(params[:customer_id])
    render json: CustomerSerializer.new(customer)
  end 


  # def update
  #   if params[:cancel] == 'true'
  #     subscription = Subscription.find(params[:subscription_id])
  #     subscription.update(status: 1)
  #     subscription.save
  #     render json: SubscriptionSerializer.new(subscription)
  #   else
  #   end

  # end 

end