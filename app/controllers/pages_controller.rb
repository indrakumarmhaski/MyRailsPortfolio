class PagesController < ApplicationController
  def home
    if  request.env["omniauth.auth"]
      @user = User.from_omniauth(request.env["omniauth.auth"])
      sign_in_and_redirect @user
    end
  end

  def aboutme
  end

  def contact
  end
end
