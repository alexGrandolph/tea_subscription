class Api::V1::SubscriptionsController < ApplicationController

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
    binding.pry

  end 

end 