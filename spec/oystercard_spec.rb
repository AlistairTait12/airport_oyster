require 'oystercard'

  describe Oystercard do
    let(:oystercard) { Oystercard.new(90) }
    let(:minimum) { subject.minimum_cap }
    let(:station) { double :station }

    describe '#balance' do
      it 'starts with a balance of 0' do
        expect(oystercard.balance).to eq(0)
      end
    end
    describe '#top_up' do
      it 'the balance will increase when you top up the oystercard' do
        oystercard.top_up(20)
        expect(oystercard.balance).to eq(20)
      end
      it 'raises error if top_up would bring balance over maximum' do
        oystercard.top_up(oystercard.oyster_limit)

        expect { oystercard.top_up(5) }.to raise_error("Maximum amount of #{oystercard.oyster_limit} already reached")
      end
      end
      describe '#deduct' do
        it 'deducts money from the balance' do
          oystercard.top_up(50)
          oystercard.touch_out
          expect(oystercard.balance).to eq(49)
        end
      end

      describe '#touch-in' do
        it 'card needs to touch in' do
          oystercard.top_up(5)
          oystercard.touch_in(station)
          expect(oystercard.in_journey?).to eq true
        end

        it 'raises an error if balance is less than £1' do
          expect{ oystercard.touch_in(station) }.to raise_error "You do not have enough money for this journey : please top up"
        end 
      end

      describe '#touch-out' do
        it 'card needs to touch out' do
          oystercard.top_up(10)
          oystercard.touch_in(station)
          oystercard.touch_out
          expect(oystercard.in_journey?).to eq false
        end

        it 'charges the minimum fare amount at end of journey' do
          expect{ oystercard.touch_out }.to change {oystercard.balance}.by -1
        end
      end
    
      describe '#entry_station' do
        it 'stores the entry station of the journey' do
        oystercard.top_up(20)
          oystercard.touch_in(station)
          expect(oystercard.entry_station).to eq station
        end
      end

      describe '#in_journey' do
        it 'returns the in_journey state' do
          oystercard.top_up(10)
          oystercard.touch_in(station)
          expect(oystercard.in_journey?).to eq true
        end
      end

  describe '#journey_history' do
    it 'should be empty when oystercard is initialized' do
      expect(oystercard.journey_history).to eq []
    end

    it 'hold journey history' do
      oystercard.touch_in(station)
      oystercard.touch_out(station)
      expect(oystercard.journey_history).to eq [{:in => station, :out => station}]
    end
  end
end

