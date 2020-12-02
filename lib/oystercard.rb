require_relative 'journey'

class Oystercard

  attr_reader :balance, :journey

  BALANCE_LIMIT = 90

  def initialize
    @balance = 0
  end

  def top_up(amount)
    fail "Can't exceed the limit of £#{BALANCE_LIMIT}" if @balance + amount > BALANCE_LIMIT
    @balance += amount
  end

  def touch_in(station)
    fail "Insufficient balance on card" if @balance < Journey::MINIMUM_AMOUNT

    @journey = Journey.new(self)

    @journey.add_entry_station(station)
  end

  def touch_out(station)
    @journey.add_exit_station(station)
    deduct(@journey.fare)
  end


  def deduct(amount)
    @balance -= amount
  end

end
