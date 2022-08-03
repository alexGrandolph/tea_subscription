require 'rails_helper'

RSpec.describe 'Get All Customer Subscriptions Endpoint' do
  describe 'Happy Path' do
  
    it 'Returns active and cancelled subscriptions' do
      customer1 = Customer.create!(first_name: 'John', last_name: 'Brisket', email: 'john@example.com', address: '123 Fake Street')
      tea1 = Tea.create!(title: 'Earl Grey', description: 'A tasty tea for sure', temp: 55, brewtime: '5')
      tea2 = Tea.create!(title: 'Green Tea', description: 'A Tea that is green', temp: 40, brewtime: '2')
      tea3 = Tea.create!(title: 'Hibiscus', description: 'probably the best tea', temp: 88, brewtime: '7')
      subscription1 = Subscription.create!(title: 'Monthly Early Grey', price: 49.98, status: 0, frequency: 1, customer_id: customer1.id, tea_id: tea1.id)
      subscription2 = Subscription.create!(title: 'Monthly Green Tea', price: 49.98, status: 1, frequency: 1, customer_id: customer1.id, tea_id: tea2.id)
      subscription3 = Subscription.create!(title: 'Weekly Hibiscus', price: 49.98, status: 1, frequency: 0, customer_id: customer1.id, tea_id: tea3.id)

      get '/api/v1/customer/subscriptions', headers: headers, params:{ customer_id: customer1.id }
      expect(response).to be_successful

      result = JSON.parse(response.body, symbolize_names: true)
      expect(result).to have_key(:data)
      expect(result[:data]).to be_a Hash
      data = result[:data]
      
      expect(data).to have_key(:id)
      expect(data[:id].to_i).to eq(customer1.id)

      expect(data).to have_key(:type)
      expect(data[:type]).to eq("customer")

      expect(data).to have_key(:attributes)
      expect(data[:attributes]).to be_a Hash
      attributes = data[:attributes]

      expect(attributes).to have_key(:first_name)
      expect(attributes).to have_key(:last_name)
      expect(attributes).to have_key(:email)
      expect(attributes).to have_key(:address)
      expect(attributes).to have_key(:subscriptions)
      
      subscriptions = attributes[:subscriptions]
      expect(subscriptions.count).to eq(3)

    end


  end

end
