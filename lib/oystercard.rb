class Oystercard
  attr_accessor :balance, :oyster_limit, :in_journey, :minimum_cap, :entry_station
  LIMIT = 90
  MINIMUM = 1
  def initialize(oyster_limit = LIMIT, minimum_cap = MINIMUM, entry_station)
    @balance = 0
    @oyster_limit = oyster_limit
    @in_journey = false
    @minimum_cap = minimum_cap
    @entry_station = entry_station
  end
  def top_up(num)
    raise "Maximum amount of #{oyster_limit} already reached" if num + @balance > LIMIT
    @balance += num
  end
  
  def touch_in(station)
    raise "You do not have enough money for this journey : please top up" if @balance < MINIMUM
    @entry_station = station
    @in_journey = true   
  end

  def touch_out
    @entry_station = nil 
    @balance -= @minimum_cap
    @in_journey = false
  end

  private

  def deduct(num)
    @balance -= num
  end
end
