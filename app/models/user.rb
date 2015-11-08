class User < ActiveRecord::Base
  has_many :links
  has_many :subscriptions

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
