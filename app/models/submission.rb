class Submission < ActiveRecord::Base
  #attr_accessor :name, :phone, :email, :address, :city, :zip, :bus, :issue, :transfer_system, :clipper, :destination
has_many :field_responses
end
