require 'spec_helper'

describe User do
  it "Should be able to find a user by name" do
  	  #attr_accessor :name, :phone_number, :email, :password, :active
  	  ben = User.new(:username => "Ben", :firstname=> "Ben",:lastname => "Poodles",  :phone_number => "707-825-6858", 
  	  	:email => "marcojoemontagna@gmail.com", :active => true) # took out :password => "abcdefghijklmnop"
      ben.save!
  	  #expect { User.where(:username => "Ben").first }.to be_truthy
          User.where(:username => "Ben").first.should_not be_nil
  end

  it "Shouldn't find nonexistant users" do
    #expect { User.where(:username => "Ben").first }.to be_nil
    User.where(:username => "Ben").first.should be_nil
  end

  it "Users should respond to #username" do
	ben = User.create(:username => "Ben", :firstname=> "Ben",:lastname => "Poodles",  :phone_number => "707-825-6858", 
	  	:email => "marcojoemontagna@gmail.com", :active => true)
 	expect(ben).to respond_to(:username)
  end

  it "User's should respond to #firstname" do
	ben = User.create(:username => "Ben", :firstname=> "Ben",:lastname => "Poodles",  :phone_number => "707-825-6858", 
	  	:email => "marcojoemontagna@gmail.com", :active => true)
 	expect(ben).to respond_to(:firstname)
  end
  it "User's should respond to #lastname" do
	ben = User.create(:username => "Ben", :firstname=> "Ben",:lastname => "Poodles",  :phone_number => "707-825-6858", 
	  	:email => "marcojoemontagna@gmail.com", :active => true)
 	expect(ben).to respond_to(:lastname)
  end
  it "User's should respond to #phone_number" do
	ben = User.create(:username => "Ben", :firstname=> "Ben",:lastname => "Poodles",  :phone_number => "707-825-6858", 
	  	:email => "marcojoemontagna@gmail.com", :active => true)
 	expect(ben).to respond_to(:phone_number)
  end
  it "User's should respond to #active" do
	ben = User.create(:username => "Ben", :firstname=> "Ben",:lastname => "Poodles",  :phone_number => "707-825-6858", 
	  	:email => "marcojoemontagna@gmail.com", :active => true)
 	expect(ben).to respond_to(:active)
  end

  it "User's should respond to #email" do
	ben = User.create(:username => "Ben", :firstname=> "Ben",:lastname => "Poodles",  :phone_number => "707-825-6858", 
	  	:email => "marcojoemontagna@gmail.com", :active => true)
 	expect(ben).to respond_to(:email)
  end


end
