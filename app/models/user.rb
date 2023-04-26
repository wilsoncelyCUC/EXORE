class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # linkedin authentication
  devise :omniauthable, omniauth_providers: [:linkedin]

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.linkedin_data"] && session["devise.linkedin_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.picture_url = auth.info.picture_url
      user.password = Devise.friendly_token[0, 20]
    end
  end
  # The first method is redefining Device ‘new_with_session’ method for our User model and the second method tries to find an existing user logged in with LinkedIn credentials (a combination of uid and provider) and if it doesn’t find one, it will create a new user with the information provided by LinkedIn.

end
