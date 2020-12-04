require_relative "journey"

class JourneyLog
  attr_accessor :trips


  def initialize(journey_class = Journey)
    @journey_class = journey_class
    @trips = []
  end

  def start(start_station)
    @start_station = start_station
    #@trips[@trips.count + 1] = [start_station, nil]
  end

  def finish(exit_station)
    @exit_station = exit_station
    current_journey
   # @trips[@trips.count][1] = exit_station
  end

  def trip_complete
    if !trips[-1][0].nil? && !trips[-1][1].nil?
      Journey::MINIMUM_AMOUNT
    else
      Journey::PENALTY
    end
  end

  private

  def current_journey
    @current_journey = [@start_station, @exit_station]
    trips << @current_journey
  end

end
