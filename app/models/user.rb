class User < ApplicationRecord
  # Connects this user object to Hydra behaviors.
  include Hydra::User
  # Connects this user object to Role-management behaviors.
  include Hydra::RoleManagement::UserRoles


  # Connects this user object to Hyrax behaviors.
  include Hyrax::User
  include Hyrax::UserUsageStats



  # Connects this user object to Blacklights Bookmarks.
  include Blacklight::User
  # devise :omniauthable, :omniauth_providers => [:cas]
  devise :database_authenticatable, :registerable, :rememberable, :validatable

  # Method added by Blacklight; Blacklight uses #to_s on your
  # user class to get a user-displayable login/identifier for
  # the account.
  def to_s
    email
  end

  def self.find_for_iu_cas(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create! do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = user.try(:ldap_mail)
      user.email = [auth.uid, '@iu.edu'].join if user.email.blank?
    end
  end
end
