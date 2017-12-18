# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController


  def doorkeeper
    data = request.env["omniauth.auth"]
    @user = User.from_omniauth(data)
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
    else
      redirect_to root_url
    end
  end

  def failure
    redirect_to root_path
  end
end
