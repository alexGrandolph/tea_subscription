# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Customer.destroy_all
Tea.destroy_all
Subscription.destroy_all

customer1 = Customer.create!(first_name: 'John', last_name: 'Brisket', email: 'john@example.com', address: '123 Fake Street')
customer2 = Customer.create!(first_name: 'Bobby', last_name: 'Pork Belly', email: 'bobbyG@example.com', address: '1556 North South St.')

tea1 = Tea.create!(title: 'Earl Grey', description: 'A tasty tea for sure', temp: 55, brewtime: '5')
tea2 = Tea.create!(title: 'Green Tea', description: 'A Tea that is green', temp: 40, brewtime: '2')
tea3 = Tea.create!(title: 'Hibiscus', description: 'probably the best tea', temp: 88, brewtime: '7')

ubscription1 = Subscription.create!(title: 'Monthly Early Grey', price: 49.98, status: 0, frequency: 1, customer_id: customer1.id, tea_id: tea1.id)
subscription2 = Subscription.create!(title: 'Monthly Green Tea', price: 49.98, status: 1, frequency: 1, customer_id: customer1.id, tea_id: tea2.id)
subscription3 = Subscription.create!(title: 'Weekly Hibiscus', price: 49.98, status: 1, frequency: 0, customer_id: customer1.id, tea_id: tea3.id)
