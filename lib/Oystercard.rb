class Oystercard
  def initialize
    @balance = 0
  end

  def add(amount)
    @balance += amount
  end
end