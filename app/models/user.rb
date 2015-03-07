class User < ActiveRecord::Base
  attr_accessible :firstname, :lastname, :username, :phone_number, :email, :password, :active

end

