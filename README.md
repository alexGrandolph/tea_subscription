<h1>Tea Subscription API</h1>


<h3>Summary</h3>
 
This Rails API offers three RESTful endpoints to a prospective front end, designed to allow a customer/user to sign up for a new tea subscription, cancel a tea subscription, and return all of a customers subscriptions regardless of status (active or cancelled).  The endpoints utilize easy to use and intuitive parameters, and only requires what is necessary without any bloat.

<h3>Set Up Instructions</h3>

To set up this repository on your local machine, please make sure you have Ruby version 2.7.4 and Rails 5.2.8 downloaded locally.  Next clone this repository to your local machine.  CD into the directory and run ` bundle install ` to install all gems and dependencies.  To launch a local server to ping the available endpoints via Postman or another API tool, enter `rails s` in your CLI. 

<h3>Testing Instructions</h3>
This project uses RSpec (rspec-rails gem) for its test suite, and SimpleCov for coverage.  This project has 99% test coverage.
<br>
To run the test suite yourself, simply run `bundle exec rspec` in your CLI.
<br>
If you would like to import the Postman collection follow this link https://www.getpostman.com/collections/3c7451038bf1026e3a11

<h3>Database / Schema </h3>
![tea subscription schema](https://user-images.githubusercontent.com/96802470/182982346-b26c49ed-9b8a-4a44-a1d8-693691aa653b.png)

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

![Screen Shot 2022-08-03 at 10 53 47 AM](https://user-images.githubusercontent.com/96802470/182665966-406c5cd8-1960-4bce-bcef-5c9e4b9cbd72.png)

