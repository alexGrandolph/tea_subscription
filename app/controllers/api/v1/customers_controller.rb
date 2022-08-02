class Api::V1::CustomersController < ApplicationController

  def create
    customer = Customer.find(params[:customer_id])
    tea = Tea.find(params[:tea_id])
    subscription = Subscription.create(title: '', price: params[:price], status: params[:status], frequency: params[:frequency], customer_id: params[:customer_id], tea_id: params[:tea_id])
    subscription.update(title: "#{subscription.frequency} #{tea.title}")
    subscription.save

    binding.pry
  end 





end 