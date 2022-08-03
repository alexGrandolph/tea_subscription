<h1>Tea Subscription API</h1>


<h3>Summary</h3>
This Rails API offers three RESTful endpoints to a prospective front end, designed to allow a customer/user to sign up for a new tea subscription, cancel a tea subscription, and return all of a customers subscriptions regardless of status (active or cancelled).  The endpoints utilize easy to use and intuitive parameters, and only requires what is necessary without any bloat.

<h3>Set Up Instructions</h3>
<div align="left">
To set up this repository on your local machine, please make sure you have Ruby version 2.7.4 and Rails 5.2.8 downloaded locally.  Next clone this repository to your local machine.  CD into the directory and run `bundle install` to install all gems and dependencies.  To launch a local server to ping the available endpoints via Postman or another API tool, enter `rails s` in your CLI. 
<h4>Testing Instructins</h4>
This project uses RSpec (rspec-rails gem) for its test suite, and SimpleCov for coverage.  This project has 99% test coverage.
<br>
To run the test suite yourself, simply run `bundle exec rspec` in your CLI.
</div>
<h3>Available Endpoints</h3>


<h4>Create a Tea Subscription for a Customer</h4>
Parameters are sent via request body to improve security. <br>
Example Request

```
  POST /api/v1/subscribe
  Content-Type: application/json
  Accept: application/json
  
  body:
    {
      "customer_id": 3,
      "tea_id": 5,
      "price": 45.50,
      "frequency": 1,
      "status": 0
    }
```
Response
```
{
    "data": {
        "id": "7",
        "type": "subscription",
        "attributes": {
            "title": "Monthly Green Tea",
            "price": 45.5,
            "status": "Active",
            "frequency": "Monthly",
            "customer_id": 3,
            "tea_id": 5,
            "updated_at": "2022-08-03T16:26:17.501Z",
            "created_at": "2022-08-03T16:26:17.501Z"
        }
    }
}
```
<br>
<h4>Cancel a Tea Subscription for a Customer</h4>
Example Request

```
  POST /api/v1/subscriptions/cancel
  Content-Type: application/json
  Accept: application/json
  
  body:
    {
      "subscription_id": 2,
      "cancel": "true"
    }
```
Response
```
{
    "data": {
        "id": "3",
        "type": "subscription",
        "attributes": {
            "title": "Weekly Hibiscus",
            "price": 49.98,
            "status": "Cancelled",
            "frequency": "Weekly",
            "customer_id": 3,
            "tea_id": 6,
            "updated_at": "2022-08-03T16:13:03.620Z",
            "created_at": "2022-08-03T16:13:03.620Z"
        }
    }
}
```
<br>
<h4>Return All of a Customers Subscriptions (Active and Cancelled)</h4>
Example Request
```
  GET /api/v1/customer/subscriptions
  Content-Type: application/json
  Accept: application/json
  
  body:
    {
      "customer_id": 6
    }
```

