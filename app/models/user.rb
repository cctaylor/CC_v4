# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name_first      :string(255)
#  name_last       :string(255)
#  email           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#  remember_token  :string(255)
#

class User < ActiveRecord::Base
  attr_accessible :email, :name_first, :name_last, :password, :password_confirmation
  has_secure_password
  
  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  validates :name_first, presence: true, length: { maximum: 25 }
  validates :name_last, presence: true, length: { maximum: 25 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 8 }
  validates :password_confirmation, presence: true
  after_validation { self.errors.messages.delete(:password_digest) }

  private

  	def create_remember_token
  		self.remember_token = SecureRandom.urlsafe_base64
  	end

end
