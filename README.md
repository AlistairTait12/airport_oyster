To test top_up method manually, load up irb and type in the following:

oyster1 = Oystercard.new
oyster1.balance
oyster1.top_up(20)
oyster1.balance => 20

To test the maximum top_up limit:

oyster1 = Oystercard.new
oyster1.balance
oyster1.top_up(90)
oyster1.balance
oyster.top_up(5)
oyster1.balance => "Reached maximum limit"

oyster1 = Oystercard.new
 => #<Oystercard:0x00007fa5220e1388 @balance=0, @oyster_limit=90> 
3.0.0 :002 > oyster1.top_up(50)
 => 50 
3.0.0 :003 > oyster1.deduct(30)
 => 20 
3.0.0 :004 > oyster1.balance
 => 20 
