Takeaway challenge
=======

This was a challenge to create a Takeaway class that could be used to order from a set menu of food. When an order is successful it sends out a message designed to allow us to practice object oriented programming, testing and mocking external gems.

Technologies used include:
-----------------------
  - ruby
  - rspec
  - twilio
  - vcr (for mocking twilio)

How to use: 
-------------
1. Git clone repo
2. Bundle install
4. Sign up for a/log into your twilio account. Change the to and from numbers in Takeaway#send_message to and use the numbers you have registered to twilio and use the secret_sid and secret_auth given to create a 'secrets.rb' file with a module in it that looks like this:
    
        module SecretsHelper
            attr_reader :client
            def set_secrets
                secret_sid = "Your twilio secret sid"
                secret_auth = "Your twilio secret auth"
                @client = Twilio::REST::Client.new(secret_sid, secret_auth)
            end
        end

4. require './lib/takeaway.rb', initialize a new instance of Takeaway and order from the menu in the format specified in the tests to receive your text.