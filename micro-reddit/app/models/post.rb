class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  VALID_LINK_REGEX = /\Ahttps*:\/\/\S*\z/
  validates :title, presence: true, length: { maximum: 255 }
  validates :link, presence: true, format: { with: VALID_LINK_REGEX }
  validates :user_id, presence: true
end
