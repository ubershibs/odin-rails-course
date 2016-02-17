class User < ActiveRecord::Base
  has_many :hosted_events, :class_name => 'Event', :foreign_key => :host_id 
  has_many :attended_events, :through => :rsvps
  has_many :rsvps, :foreign_key => :attendee_id

  before_save :downcase_email
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, 
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  def attending?(event)
    event.attendees.include?(self)
  end

  def attend!(event)
    rsvps.create(attended_event_id: event.id)
  end

  def cancel!(event)
    self.rsvps.find_by(attended_event_id: event.id).destroy
  end

  private
    def downcase_email
      self.email = email.downcase
    end
end
