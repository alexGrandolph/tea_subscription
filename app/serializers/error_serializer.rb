class ErrorSerializer

  def self.bad_subscription
   {
      "data": {
        "type": "Error",
        "id": "nil",
        "attributes": {
          "message": "Missing parameters to create a subscription"
        }
      }
   }
  end

  def self.bad_subscription_id
   {
      "data": {
        "type": "Error",
        "id": "nil",
        "attributes": {
          "message": "Unable to find a subscription with given ID"
        }
      }
   }
  end

  def self.missing_parameters
   {
      "data": {
        "type": "Error",
        "id": "nil",
        "attributes": {
          "message": "Request is missing required parameters"
        }
      }
   }
  end

end
