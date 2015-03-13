# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#movies = [{:title => 'Aladdin', :rating => 'G', :release_date => '25-Nov-1992'},
#    	  {:title => 'The Terminator', :rating => 'R', :release_date => '26-Oct-1984'},
#    	  {:title => 'When Harry Met Sally', :rating => 'R', :release_date => '21-Jul-1989'},
#      	  {:title => 'The Help', :rating => 'PG-13', :release_date => '10-Aug-2011'},
#      	  {:title => 'Chocolat', :rating => 'PG-13', :release_date => '5-Jan-2001'},
#      	  {:title => 'Amelie', :rating => 'R', :release_date => '25-Apr-2001'},
#      	  {:title => '2001: A Space Odyssey', :rating => 'G', :release_date => '6-Apr-1968'},
#      	  {:title => 'The Incredibles', :rating => 'PG', :release_date => '5-Nov-2004'},
#      	  {:title => 'Raiders of the Lost Ark', :rating => 'PG', :release_date => '12-Jun-1981'},
#      	  {:title => 'Chicken Run', :rating => 'G', :release_date => '21-Jun-2000'},
#  	 ]

#movies.each do |movie|
#  Movie.create!(movie)
#end

<<<<<<< HEAD

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

=======
SurveyTemplates
>>>>>>> 30e69a9b250f13d7e5ca613245a4369199055282
