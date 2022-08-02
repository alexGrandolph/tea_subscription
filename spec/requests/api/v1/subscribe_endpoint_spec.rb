require 'rails_helper'

RSpec.describe 'Subscribe User Endpoint' do
  describe 'Happy Path' do
    
    it 'Allows a user to subscribe to a Tea Subscription' do
      customer1 = Customer.create!(first_name: 'John', last_name: 'Brisket', email: 'john@example.com', address: '123 Fake Street')
      customer2 = Customer.create!(first_name: 'Bobby', last_name: 'Pork Belly', email: 'bobbyG@example.com', address: '1556 North South St.')

      tea1 = Tea.create!(title: 'Earl Grey', description: 'A tasty tea for sure', temp: 55, brewtime: '5')
      tea2 = Tea.create!(title: 'Green Tea', description: 'A tea that is green', temp: 62, brewtime: '2')
      headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
      payload = {
        customer_id: customer1.id,
        tea_id: tea1.id,
        title: 'Monthly Early Grey',
        price: 45.50,
        frequency: 1,
        status: 0
      }
   
      post '/api/v1/subscribe', headers: headers, params: JSON.generate(payload)
      expect(response).to be_successful
      expect(response.status).to eq 201
      result = JSON.parse(response.body, symbolize_names: true)
      # binding.pry
      expect(result).to have_key(:data)
      expect(result[:data]).to be_a Hash
      data = result[:data]

    end





  end 

end