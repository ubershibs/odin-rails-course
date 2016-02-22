class FlightsController < ApplicationController
  
  def index
    @airports = Airport.all.map {|a| [a.code, a.id]}
    @passengers = [[1,1],[2,2],[3,3],[4,4]]
    @dates = Flight.flying_dates
    @flights = Flight.search(params)
    @all_flights = Flight.all
    respond_to do |format|
      format.html
      format.json { render :json => @all_flights }
    end
  end

end
