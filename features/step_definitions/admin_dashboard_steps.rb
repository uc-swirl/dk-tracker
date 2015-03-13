 
Given /the following users exist/ do |user_table|
  user_table.hashes.each do |user|
    #    | firstname | lastname    | phone_number   | email               | admin | password |
    user[:admin] = user[:admin] == "true"
    user[:password_confirmation] = user[:password]
    User.create!(user)
  end
end

Given /^(?:|I )have logged in as (.+) with password (.+)$/ do |email, password|
  fill_in("user_email", :with => email)
  fill_in("user_password", :with => password)
  click_button("Sign in")
end

Then /^there should be some links to admin actions$/ do
  expect(page.has_css?(".admin_links")).to be true
end

Then /^(?:|I )should see links to admin actions$/ do
  expect(page.has_css?(".admin_links")).to be true 
end


Then /^(?:|I )should( not)? be (?:re)?directed to (.+)$/ do |negate, page_name|
  current_path = URI.parse(current_url).path
  if (negate == " not") 
    if current_path.respond_to? :should
      current_path.should_not == path_to(page_name)
    else
      assert_not_equal path_to(page_name), current_path
    end
  else 
    if current_path.respond_to? :should
      current_path.should == path_to(page_name)
    else
      assert_equal path_to(page_name), current_path
    end
  end
end

Then /^I should not be logged in$/ do 
  visit path_to("the admin dashboard")
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should == path_to("admin login")
  else
    assert_equal path_to("admin login"), current_path
  end
end
    
