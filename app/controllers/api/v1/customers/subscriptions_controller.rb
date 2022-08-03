class Api::V1::Customers::SubscriptionsController < ApplicationController

  def index
    customer = Customer.find(params[:customer_id])
    render json: CustomerSerializer.new(customer)
    # binding.pry
  end 


end