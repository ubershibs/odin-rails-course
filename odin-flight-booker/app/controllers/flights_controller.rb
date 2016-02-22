class FlightsController < ApplicationController
  
  def index
    @airports = Airport.all.map {|a| [a.code, a.id]}
    @passengers = [[1,1],[2,2],[3,3],[4,4]]
    @dates = Flight.flying_dates
    @flights = Flight.search(params)
  end

end
