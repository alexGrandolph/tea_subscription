class ErrorSerializer

  def self.bad_subscription
   {
      "data": {
        "type": "Error",
        "id": "nil",
        "attributes": {
          "type": "Missing parameters to create a subscription"
        }
      }
   }
  end

end
