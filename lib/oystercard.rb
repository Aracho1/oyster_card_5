require_relative 'journey'
require_relative 'journeylog'

class Oystercard

  attr_accessor :balance
  attr_reader :journey_log

  BALANCE_LIMIT = 90

  def initialize
    @balance = 0
    @journey_log = JourneyLog.new
  end

  def top_up(amount)
    fail "Can't exceed the limit of £#{BALANCE_LIMIT}" if @balance + amount > BALANCE_LIMIT
    @balance += amount
  end

  def touch_in(station)
    fail "Insufficient balance on card" if @balance < Journey::MINIMUM_AMOUNT

    @journey_log = JourneyLog.new(self)

    @journey_log.start(station)
  end

  def touch_out(station)
    @journey_log.finish(station)
    @current_fare = @journey_log.trip_complete
    deduct(@current_fare)
  end

  def deduct(fare)
    @balance -= fare
  end

end
