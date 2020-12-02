require_relative 'oystercard'

class Journey

  attr_reader :trips

  PENALTY = 6
  MINIMUM_AMOUNT = 1

  def initialize(card)
    @card = card
    @trips = {}
  end

  def penalty_fare
    @card.deduct(PENALTY)
  end

  def in_journey?
    if trips.empty? then false elsif no_exit? then true else false end
  end

  def no_exit?
    @trips[trips.count][1] == nil
  end

  def add_entry_station(station)
    @trips[@trips.count + 1] = [station, nil]
  end

  def add_exit_station(station)
    @trips[@trips.count][1] = station
  end

  def fare
    penalty? ? PENALTY : MINIMUM_AMOUNT
  end

  def penalty?
    @trips[@trips.count][0] == nil || @trips[@trips.count][1] == nil
  end


end
