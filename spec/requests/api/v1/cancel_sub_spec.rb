require 'rails_helper'

RSpec.describe 'Cancel Customer Subscription Endpoint' do
  describe 'Happy Path' do
  
    it 'Cancels a customers tea subscription' do
      customer1 = Customer.create!(first_name: 'John', last_name: 'Brisket', email: 'john@example.com', address: '123 Fake Street')
      tea1 = Tea.create!(title: 'Earl Grey', description: 'A tasty tea for sure', temp: 55, brewtime: '5')
      subscription = Subscription.create!(title: 'Weekly Early Grey', price: 49.98, status: 0, frequency: 0, customer_id: customer1.id, tea_id: tea1.id)
      payload = {
        subscription_id: subscription.id,
        cancel: true
      }
   
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

    end
  end

end 