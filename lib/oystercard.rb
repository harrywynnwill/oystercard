require_relative 'journey'

class Oystercard
	MAX_BALANCE = 90
  MIN_FARE = 1
	attr_reader :balance, :max_balance, :entry_station, :card_journeys, :exit_station

	def initialize(max_balance=MAX_BALANCE)
		@balance = 0
		@max_balance = max_balance
    @card_journeys = []
	end

	def top_up(amount)
		fail "Can't top up over £#{max_balance}" if @balance + amount > max_balance
		@balance += amount
	end


  def touch_in(station)
   # raise "card already in journey" if in_journey?
	 	if last_journey.complete?
			deduct_fare(last_journey.fare)
		else
	    fail "not enough money on the card min balance of £#{MIN_FARE}" if @balance < MIN_FARE
	    @entry_station = station
	    @card_journeys << Journey.new
			last_journey.start(station)
		end
  end

  def touch_out(station)
	#	@card_journeys.last.complete?
   # fail "card not in journey" unless in_journey?
    last_journey.finish(station)
    fare = last_journey.fare
    deduct_fare(fare)
  end

private

  # def in_journey?
  #   !!@entry_station
  # end

	def last_journey
		@card_journeys.last
	end

  def deduct_fare fare
    @balance -= fare
  end

end
