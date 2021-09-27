class Oystercard
  def initialize
    @balance = 0
  end

  def add(amount)
    @balance + amount > 100 ? (fail "breaches maximum amount") : @balance += amount 
  end
end

# In order to protect my money
# As a customer
# I don't want to put too much money on my card