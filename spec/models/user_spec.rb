require 'spec_helper'

describe User do
  it "Should be able to find a user by name" do
  	  #attr_accessor :name, :phone_number, :email, :password, :active
  	  ben = User.create(:username => "Ben", :firstname=> "Ben",:lastname => "Poodles",  :phone_number => "707-825-6858", 
  	  	:email => "marcojoemontagna@gmail.com", :password => "abcd", :active => true)
  	  expect(User.find(:username => "Ben")).to be_truthy 
  end

  it "Shouldn't find nonexistant users" do
  	  expect { User.find(:username => "Ben")}.to raise_error
  end

  it "Users should respond to #username" do
	ben = User.create(:username => "Ben", :firstname=> "Ben",:lastname => "Poodles",  :phone_number => "707-825-6858", 
	  	:email => "marcojoemontagna@gmail.com", :password => "abcd", :active => true)
 	expect(ben).to respond_to(:username)
  end

  it "User's should respond to #firstname" do
	ben = User.create(:username => "Ben", :firstname=> "Ben",:lastname => "Poodles",  :phone_number => "707-825-6858", 
	  	:email => "marcojoemontagna@gmail.com", :password => "abcd", :active => true)
 	expect(ben).to respond_to(:firstname)
  end
  it "User's should respond to #lastname" do
	ben = User.create(:username => "Ben", :firstname=> "Ben",:lastname => "Poodles",  :phone_number => "707-825-6858", 
	  	:email => "marcojoemontagna@gmail.com", :password => "abcd", :active => true)
 	expect(ben).to respond_to(:lastname)
  end
  it "User's should respond to #phone_number" do
	ben = User.create(:username => "Ben", :firstname=> "Ben",:lastname => "Poodles",  :phone_number => "707-825-6858", 
	  	:email => "marcojoemontagna@gmail.com", :password => "abcd", :active => true)
 	expect(ben).to respond_to(:phone_number)
  end
  it "User's should respond to #active" do
	ben = User.create(:username => "Ben", :firstname=> "Ben",:lastname => "Poodles",  :phone_number => "707-825-6858", 
	  	:email => "marcojoemontagna@gmail.com", :password => "abcd", :active => true)
 	expect(ben).to respond_to(:active)
  end

  it "User's should respond to #email" do
	ben = User.create(:username => "Ben", :firstname=> "Ben",:lastname => "Poodles",  :phone_number => "707-825-6858", 
	  	:email => "marcojoemontagna@gmail.com", :password => "abcd", :active => true)
 	expect(ben).to respond_to(:email)
  end


end
