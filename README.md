<h1>Tea Subscription API</h1>


<h3>Summary</h3>
This Rails API offers three RESTful endpoints to a prospective front end, designed to allow a customer/user to sign up for a new tea subscription, cancel a tea subscription, and return all of a customers subscriptions regardless of status (active or cancelled).  The endpoints utilize easy to use and intuitive parameters, and only requires what is necessary without any bloat.

<h3>Set Up Instructions</h3>
<div align="left">
To set up this repository on your local machine, please make sure you have Ruby version 2.7.4 and Rails 5.2.8 downloaded locally.  Next clone this repository to your local machine.  CD into the directory and run `bundle install` to install all gems and dependencies.  To launch a local server to ping the available endpoints via Postman or another API tool, enter ```rails s``` in your CLI. 
<h4>Testing Instructins</h4>
This project uses RSpec (rspec-rails gem) for its test suite, and SimpleCov for coverage.  This project has 99% test coverage.
<br>
To run the test suite yourself, simply run `bundle exec rspec` in your CLI.
</div>
<h3>Available Endpoints</h3>
Currently, this project offers three endpoints.

<h4>Create a Tea Subscription for a Customer</h4>
```
GET /api/v1/forecast?location=denver,co
Content-Type: application/json
Accept: application/json
```

  
