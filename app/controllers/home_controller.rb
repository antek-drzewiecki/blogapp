class HomeController < ApplicationController
  def index
  end

  def posts
    begin
      @raw_posts = doorkeeper_access_token.get('/api/v1/posts/?format=json').parsed
    rescue  OAuth2::Error => e
      # Not pretty but couldnt get around it.
      if e.code == "Not authorized"
        sign_out current_user
        redirect_to destroy_user_session_path
      end
    end
  end
end
