class Oystercard
  attr_accessor :balance

  def initialize
    @balance = 0
  end

  def top_up(value)
   @balance = @balance + value
  # @balance += value
  end

end
