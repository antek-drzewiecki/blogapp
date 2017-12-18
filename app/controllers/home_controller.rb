class HomeController < ApplicationController
  def index

  end

  def posts
    begin
      @raw_posts = doorkeeper_access_token.get('/api/v1/posts/?format=json').parsed
    rescue  OAuth2::Error => e
      redirect_to destroy_user_session_path if e.code == "Not authorized"
    end

  end
end
