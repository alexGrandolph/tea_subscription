require 'rails_helper'

RSpec.describe 'Cancel Customer Subscription Endpoint' do
  describe 'Happy Path' do
  
    it 'Cancels a customers tea subscription' do
      customer1 = Customer.create!(first_name: 'John', last_name: 'Brisket', email: 'john@example.com', address: '123 Fake Street')
      tea1 = Tea.create!(title: 'Earl Grey', description: 'A tasty tea for sure', temp: 55, brewtime: '5')
      subscription = Subscription.create!(title: 'Weekly Early Grey', price: 49.98, status: 0, frequency: 0, customer_id: customer1.id, tea_id: tea1.id)
   
      post '/api/v1/subscriptions/cancel', headers: headers, params:{ subscription_id: subscription.id, cancel: true }

      expect(response).to be_successful
      result = JSON.parse(response.body, symbolize_names: true)
      expect(result).to have_key(:data)
      expect(result[:data]).to be_a Hash
      
      data = result[:data]
      expect(data).to have_key(:id)
      expect(data[:id]).to be_a String

      expect(data).to have_key(:type)
      expect(data[:type]).to be_a String
      expect(data[:type]).to eq("subscription")
      
      attributes = data[:attributes]
      expect(attributes).to have_key(:status)
      expect(attributes[:status]).to eq("Cancelled")
      expect(customer1.subscriptions[0].status).to eq("Cancelled")
    end
  end

  describe 'Sad Path' do
    
    it 'Bad Subscription ID returns error' do
      customer1 = Customer.create!(first_name: 'John', last_name: 'Brisket', email: 'john@example.com', address: '123 Fake Street')
      tea1 = Tea.create!(title: 'Some Tea', description: 'A tasty tea for sure', temp: 55, brewtime: '5')
      subscription = Subscription.create!(title: 'Weekly Tea', price: 49.98, status: 0, frequency: 0, customer_id: customer1.id, tea_id: tea1.id)

      post '/api/v1/subscriptions/cancel', headers: headers, params:{ subscription_id: 888, cancel: true }

      expect(response).to be_successful

      result = JSON.parse(response.body, symbolize_names: true)
      expect(result).to have_key(:data)
      expect(result[:data]).to be_a Hash
      
      data = result[:data]
      expect(data).to have_key(:type)
      expect(data[:type]).to eq("Error")

      expect(result[:data]).to have_key(:attributes)
      expect(result[:data][:attributes]).to have_key(:message)
      expect(result[:data][:attributes][:message]).to eq("Unable to find a subscription with given ID")

    end 

    it 'Not including cancel: true returns an error' do
      customer1 = Customer.create!(first_name: 'John', last_name: 'Brisket', email: 'john@example.com', address: '123 Fake Street')
      tea1 = Tea.create!(title: 'Some Tea', description: 'A tasty tea for sure', temp: 55, brewtime: '5')
      subscription = Subscription.create!(title: 'Weekly Tea', price: 49.98, status: 0, frequency: 0, customer_id: customer1.id, tea_id: tea1.id)

      post '/api/v1/subscriptions/cancel', headers: headers, params:{ subscription_id: subscription.id, cancel: false }

      expect(response).to be_successful

      result = JSON.parse(response.body, symbolize_names: true)
      expect(result).to have_key(:data)
      expect(result[:data]).to be_a Hash
      
      data = result[:data]
      expect(data).to have_key(:type)
      expect(data[:type]).to eq("Error")

      expect(result[:data]).to have_key(:attributes)
      expect(result[:data][:attributes]).to have_key(:message)
      expect(result[:data][:attributes][:message]).to eq("Request is missing required parameters")

    end 




  end 

end 