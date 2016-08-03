class Category < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :user
  has_many :subscriptions
end
