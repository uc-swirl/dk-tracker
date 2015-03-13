class SigninFailure < Devise::FailureApp
  def redirect_url
    if (request.referer) 
      request.referer
    else
      "/"
    end
    
  end

  def respond
    if http_auth?
      http_auth
    else
      redirect
    end
  end
end
