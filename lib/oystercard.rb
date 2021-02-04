class Oystercard
  attr_reader :balance, :entry_station, :oyster_limit, :journey_history
  LIMIT = 90
  MINIMUM = 1
  def initialize(oyster_limit = LIMIT, minimum_cap = MINIMUM)
    @balance = 0
    @oyster_limit = oyster_limit
    @minimum_cap = minimum_cap
    @entry_station = nil
    @journey_history = []
  end
  def top_up(num)
    raise "Maximum amount of #{oyster_limit} already reached" if num + @balance > LIMIT
    @balance += num
  end
  
  def touch_in(station)
    raise "You do not have enough money for this journey : please top up" if @balance < MINIMUM
    @entry_station = station 
  end

  def touch_out
    @entry_station = nil 
    @balance -= @minimum_cap
  end

  def in_journey?
    @entry_station == nil ? false : true
  end

  private

  def deduct(num)
    @balance -= num
  end
end