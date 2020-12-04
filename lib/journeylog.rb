class JourneyLog
  attr_accessor :trips


  def initialize(journey_class = Journey)
    @journey_class = journey_class
    @trips = {}
  end

  def start
    @trips[@trips.count + 1] = [station, nil]
  end

  def finish
    @trips[@trips.count][1] = station
  end

  def current_journey
    @trips.last
  end



end
