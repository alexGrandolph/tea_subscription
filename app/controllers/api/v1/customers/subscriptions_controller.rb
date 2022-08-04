class Api::V1::Customers::SubscriptionsController < ApplicationController

  def index
    customer = Customer.find(params[:customer_id])
    render json: CustomerSerializer.new(customer)
  end 


  def create
    customer = Customer.find(params[:customer_id])
    tea = Tea.find(params[:tea_id])
    subscription = Subscription.create(price: params[:price], status: params[:status], frequency: params[:frequency], customer_id: params[:customer_id], tea_id: params[:tea_id])
    subscription.update(title: "#{subscription.frequency} #{tea.title}")
    subscription.save
    render json: SubscriptionSerializer.new(subscription), status: 201
    # render json: SubscriptionSerializer.create_subscription(subscription, customer, tea), status: 201
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