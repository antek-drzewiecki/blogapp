class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :omniauthable

  def self.from_omniauth(oauth_data)
    User.find_or_initialize_by_doorkeeper_uid(oauth_data.uid).tap do |user|
      user.email = oauth_data.info.email
    end
  end

  def update_doorkeeper_credentials(oauth_data)
    self.doorkeeper_access_token = oauth_data.credentials.token
  end

end
