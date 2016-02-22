class Flight < ActiveRecord::Base
  belongs_to :from_airport, class_name: "Airport"
  belongs_to :to_airport, class_name: "Airport"
  has_many :bookings
  has_many :passengers, through: :passenger_bookings

  def self.search(params)
    if params[:search] 
      date = params[:date].to_date
      Flight.where(from_airport_id: params[:from], to_airport_id: params[:to], 
                   start_time: date.beginning_of_day..date.end_of_day)
                  .order(start_time:  :asc)
    else
      Flight.none
    end
  end

  def self.flying_dates
    pluck(:start_time).sort.map{ |d| [d.strftime("%a, %b %d,%Y"), d.to_date] }.uniq
  end

  def flight_date
     date = self.start_time.strftime("%b %d %Y")
  end

  def flight_time
    time = self.start_time.strftime("%H:%M %Z")
  end
end
