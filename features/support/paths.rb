# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name


    when /^the admin dashboard$/ then dashboard_path

    when /^admin login$/ then dashboard_login_path

    when /^the admin login page$/ then dashboard_login_path

    #when /^volunteer login$/ then new_user_session_path

    #when /^the volunteer login page$/ then new_user_session_path


    #when /^the volunteer dashboard$/ then volunteer_path

    #when /^the password reset page$/ then new_user_password_path

      
		
    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #	When /^the edit page then '/movies'

    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
