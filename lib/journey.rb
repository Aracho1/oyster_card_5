require_relative 'oystercard'

class Journey

  attr_reader :penalty, :minimum_amount

  PENALTY = 6
  MINIMUM_AMOUNT = 1

  def intialize(start_station = nil, exit_station = nil)
    @start_station = start_station
    @exit_station = exit_station
  end

  def start(station)
    @start_station = station
  end

  def exit(station)
    @exit_station = station
  end

  def in_journey?
    !@start_station.nil? && @exit_station.nil?
  end

  def valid_trip?
    !@start_station.nil? && !@exit_station.nil?
  end

  def fare
    valid_trip? ? PENALTY : MINIMUM_AMOUNT
  end


end
