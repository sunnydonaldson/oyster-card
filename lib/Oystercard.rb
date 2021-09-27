class Oystercard
  MAXIMUMLIMIT = 100

  def initialize
    @balance = 0
    @in_use = false
  end

  def add(amount)
    @balance + amount > MAXIMUMLIMIT ? (fail "breaches maximum amount") : @balance += amount 
  end

  def charge(fare)
    @balance - fare < 0 ? (fail "breaches minimum amount") : @balance -= fare 
  end 

  def touch_in
    in_journey?() ? (fail "already in journey") : @in_use = true
  end

  def touch_out
    !in_journey?() ? (fail "not in journey") : @in_use = false
  end
  
  private
  def in_journey?
    @in_use == true
  end
end