class Oystercard
  attr_accessor :balance

  MAXIMUM_LIMIT = 90
  DEFAULT_BALANCE = 0
  MINIMUM_BALANCE = 1

  def initialize
    @balance = 0
    @in_use = false
  end

  def top_up(value)
   raise "Max Balance reached. Your balance is: #{@balance}" if @balance == MAXIMUM_LIMIT
   @balance += value
  # @balance += value
  end

  def deduct(fare)
    @balance -= fare
  end

  def in_journey?
    @in_use
  end

  def touch_in
    balance_check
    @in_use = true

  end

  def touch_out
    @in_use = false
  end

  def balance_check
    raise "You do not have enough balance. Minimum needed: £1" if @balance < MINIMUM_BALANCE
end
end
