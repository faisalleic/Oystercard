class Oystercard
  attr_accessor :balance, :in_use, :entry_station

  MAXIMUM_LIMIT = 90
  DEFAULT_BALANCE = 0
  MINIMUM_FARE = 1

  def initialize
    @balance = 0
    @in_use = false
    @entry_station
  end

  def top_up(value)
   raise "Max Balance reached. Your balance is: #{@balance}" if @balance == MAXIMUM_LIMIT
   @balance += value
  # @balance += value
  end

  def in_journey?
    !!entry_station
  end

  def touch_in(station)
    balance_check
    @entry_station = station
    @in_use = true

  end

  def touch_out
    @in_use = false
    deduct(MINIMUM_FARE)
    @entry_station = nil
  end

  def balance_check
    raise "You do not have enough balance. Minimum needed: £1" if @balance < MINIMUM_FARE
end

  def entry_station
    @entry_station
  end



private
  def deduct(fare)
    @balance -= fare
  end

end
