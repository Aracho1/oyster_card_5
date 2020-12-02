class Oystercard

  attr_reader :balance, :trips
  BALANCE_LIMIT = 90
  MINIMUM_AMOUNT = 1

  def initialize
    @balance = 0
    @trips = {}
  end

  def top_up(amount)
    fail "Can't exceed the limit of £#{BALANCE_LIMIT}" if @balance + amount > BALANCE_LIMIT
    @balance += amount
  end

  def touch_in(station)
    fail "Insufficient balance on card" if @balance < MINIMUM_AMOUNT
    add_entry_station(station)
  end

  def touch_out(station)
    deduct(MINIMUM_AMOUNT)
    add_exit_station(station)
  end

  def in_journey?
    if trips.empty?
      false
    elsif @trips[trips.count][1] == nil
      true
    else
      false
    end
  end

  private

  def add_entry_station(station)
    @trips[@trips.count + 1] = [station, nil]
  end

  def add_exit_station(station)
    @trips[@trips.count][1] = station
  end

  def deduct(amount)
    @balance -= amount
  end

end
