class Api::V1::Customers::SubscriptionsController < ApplicationController

  def index
    customer = Customer.find(params[:customer_id])
    render json: CustomerSerializer.new(customer)
  end 


  def create
    tea = Tea.find(params[:tea_id])
    subscription = Subscription.create(price: params[:price], status: params[:status], frequency: params[:frequency], customer_id: params[:customer_id], tea_id: params[:tea_id])
    subscription.update(title: "#{subscription.frequency} #{tea.title}")
    if subscription.save
      render json: SubscriptionSerializer.new(subscription), status: 201
    else
      render json: ErrorSerializer.bad_subscription
      binding.pry
    end

  end 

  def update
    if params[:cancel] == 'true'
      subscription = Subscription.find(params[:subscription_id])
      subscription.update(status: 1)
      subscription.save
      render json: SubscriptionSerializer.new(subscription)
    else
    end
  end 

end