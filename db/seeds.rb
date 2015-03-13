# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#movies.each do |movie|
#  Movie.create!(movie)
#end


s = SurveyTemplate.create
s.text_question_fields.build(:question_title => "Name:")
s.phone_fields.build(:question_title => "Phone:")
s.email_fields.build(:question_title => "Email:")
s.text_question_fields.build(:question_title => "Address:")
s.text_question_fields.build(:question_title => "City:")
s.text_question_fields.build(:question_title => "Zip:")
s.text_question_fields.build(:question_title => "My bus lines:")
s.text_question_fields.build(:question_title => "Main bus issues:")
s.save!

User.create!(:email => "marcojoemontagna@gmail.com", :password => "12345678", :password_confirmation => "12345678", :admin => true)
User.create!(:email => "mm999223@gmail.com", :password => "12345678", :password_confirmation => "12345678", :admin => false)

