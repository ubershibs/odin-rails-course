class User < ActiveRecord::Base
  has_secure_password

  validates :username, presence: true, length: { in: 6..20 },
                       uniqueness: { case_sensitive: false}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, length: { maximum: 255 }, allow_nil: true,
                    format: { with: VALID_EMAIL_REGEX, message: "is not a valid email"}

  validates :password, presence: true, length: { minimum: 6 }

end
