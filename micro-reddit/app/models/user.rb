class User < ActiveRecord::Base
  has_many :posts
  has_many :comments 
  
  validates :username, presence: true, length: { maximum: 16 },
                       uniqueness: { case_sensitive: false }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, length: { maximum: 255 }, allow_nil: true,
                    format: { with: VALID_EMAIL_REGEX, message: "Not a valid email"}
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end
