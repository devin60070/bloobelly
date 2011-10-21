class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :authentications_attributes
  authenticates_with_sorcery! do |config|
    config.authentications_class = Authentication
  end
  validates_confirmation_of :password
  has_many :authentications, :dependent => :destroy
  accepts_nested_attributes_for :authentications
end
