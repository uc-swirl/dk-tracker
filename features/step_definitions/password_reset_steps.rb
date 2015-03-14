
Then /^an email should be sent$/ do
  ActionMailer::Base.deliveries.count.should == 1

end