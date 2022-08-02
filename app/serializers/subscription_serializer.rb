class SubscriptionSerializer
  include JSONAPI::Serializer
  attributes :title, :price, :status, :frequency, :customer_id, :tea_id, :updated_at, :created_at
  
end 
  
  
  
  
  
  
  
  # def self.create_subscription(subscription, customer, tea)
  #   {
  #     "data": {
  #       "type": "Subscription",
  #       "id": "#{subscription.id}",
  #       "attributes": {
  #         "subscription_title": "#{subscription.title}",
  #         "subscription_price": "#{subscription.price}",
  #         "status": "#{subscription.status}",
  #         "frequency": "#{subscription.frequency}",
  #         "created_at": "#{subscription.created_at}",
  #         "updated_at": "#{subscription.updated_at}",
  #         "customer": {
  #           "customer_name": "#{customer.first_name} #{customer.last_name}",
  #           "address": "#{customer.address}"
  #         },
  #         "tea": {
  #           "tea_title": "#{tea.title}",
  #           "description": "#{tea.description}",
  #           "temp": "#{tea.temp}",
  #           "brewtime": "#{tea.brewtime}",
  #         }
  #       }
  #     }
  #   }
  # end 

