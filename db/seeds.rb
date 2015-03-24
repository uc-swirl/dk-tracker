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
s.text_question_fields.build(:question_title => "Professor:")
s.text_question_fields.build(:question_title => "Department:")
s.text_question_fields.build(:question_title => "Course:")
s.text_question_fields.build(:question_title => "Comments:")
s.save!

s = SurveyTemplate.create
s.text_question_fields.build(:question_title => "Favourite colour:")
s.text_question_fields.build(:question_title => "Speed of a diving swallowtail:")
s.save!

User.create!(:email => "m.arcojoemontagna@gmail.com", :admin => true)
User.create!(:email => "m.m999223@gmail.com", :admin => false)

