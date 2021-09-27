class Oystercard
  MAXIMUMLIMIT = 100
  MINIMUMCHARGE = 1
  def initialize
    @balance = 0
    @in_use = false
    @last_touch_in
  end

  def add(amount)
    @balance + amount > MAXIMUMLIMIT ? (fail "breaches maximum amount") : @balance += amount 
  end

  def touch_in(location)
    (fail "breaches minimum amount") if @balance  < 1 
    in_journey?() ? (fail "already in journey") : @in_use = true
    @last_touch_in = location
  end

  def touch_out
    !in_journey?() ? (fail "not in journey") : @in_use = false
    charge
    @last_touch_in = nil
  end
  
  private
  def charge(fare = MINIMUMCHARGE)
    @balance -= fare 
  end 

  def in_journey?
    @in_use == true
  end
end