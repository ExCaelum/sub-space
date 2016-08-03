class User < ApplicationRecord
  validates :refresh_token, presence: true
  validates :name, presence: true
  validates :uid, presence: true
  validates :token, presence: true

  has_many :subscriptions
  has_many :categories

  def self.from_omniauth(auth_info)
  where(uid: auth_info[:uid]).create do |new_user|
    new_user.uid                = auth_info.uid
    new_user.name               = auth_info.info.name
    new_user.first_name         = auth_info.info.first_name
    new_user.last_name          = auth_info.info.last_name
    new_user.token              = auth_info.credentials.token
    new_user.refresh_token      = auth_info.credentials.refresh_token
    end
  end

end
