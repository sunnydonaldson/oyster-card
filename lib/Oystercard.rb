class Oystercard
  MAXIMUMLIMIT = 100
  def initialize
    @balance = 0
  end

  def add(amount)
    @balance + amount > MAXIMUMLIMIT ? (fail "breaches maximum amount") : @balance += amount 
  end

  def charge(fare)
    @balance - fare < 0 ? (fail "breaches minimum amount") : @balance -= fare 
  end 
end