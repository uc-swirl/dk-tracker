class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :admin
  attr_accessible :firstname, :lastname, :username, :phone_number, :email, :password, :active, :admin

  def surveyTemplates #This is a dev stub, remove when user is associated with SurveyTemplates
    SurveyTemplate.all
  end

end

