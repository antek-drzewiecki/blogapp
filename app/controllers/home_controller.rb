class HomeController < ApplicationController
  def index

  end

  def posts
      @raw_posts = doorkeeper_access_token.get('/api/v1/posts/?format=json').parsed
  end
end
