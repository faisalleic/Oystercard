class Oystercard
  attr_accessor :balance

  MAXIMUM_LIMIT = 90
  DEFAULT_BALANCE = 0

  def initialize
    @balance = 0
  end

  def top_up(value)
   raise "Max Balance reached. Your balance is: #{@balance}" if @balance == MAXIMUM_LIMIT
   @balance += value
  # @balance += value
  end

end
