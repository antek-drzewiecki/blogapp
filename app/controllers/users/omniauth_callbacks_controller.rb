# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController


  def doorkeeper
    data = request.env["omniauth.auth"]
    @user = User.from_omniauth(data)
    @user.update_doorkeeper_credentials(data)
    @user.save

    sign_in_and_redirect @user
  end

end
