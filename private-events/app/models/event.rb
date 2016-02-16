class Event < ActiveRecord::Base
  scope :past, -> { where('date < :today', {today: Time.now.to_date}) }
  scope :upcoming, -> { where('date >= :today', {today: Time.now.to_date}) }

  belongs_to :host, :class_name => "User"
  has_many :rsvps, :foreign_key => :attended_event_id
  has_many :attendees, :through => :rsvps
  validates :name, presence: true
end
