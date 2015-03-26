class StudentResponse < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :email
  belongs_to :survey_template
end
