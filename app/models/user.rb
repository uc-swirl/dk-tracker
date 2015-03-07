class User < ActiveRecord::Base
	attr_accessor :name, :phone_number, :email, :password, :active?

end