<<<<<<< HEAD
require "oystercard"

describe Oystercard do
  subject(:oystercard) { described_class.new }

  it "has a starting balance of zero" do
    expect(oystercard.balance).to eq Oystercard::INITIAL_BALANCE
  end

  describe "#top_up" do

    context "adding a valid amount" do
      let(:amount) { rand(Oystercard::MAX_BALANCE) }
      it "tops up the balance with the specified amount" do
        oystercard.top_up(amount)
        expect(oystercard.balance).to eq amount
      end
    end

    context "exceeding the maximum balance" do
      before { oystercard.top_up Oystercard::MAX_BALANCE }
      it "raises an error" do
        expect{ oystercard.top_up 1 }.to raise_error Oystercard::MAX_BAL_ERR
      end
      it "does not top up the balance" do
        begin
          oystercard.top_up 1
        rescue
          expect(oystercard.balance).to eq Oystercard::MAX_BALANCE
        end
      end
    end
  end
end
=======
require 'oystercard'

describe Oystercard do
subject(:card) {Oystercard.new}
#let (:card_topped_up) {card.top_up(50)}
it { is_expected.to respond_to(:top_up) }
#it { is_expected.to respond_to(:deduct_fare).with(1).argument }
it { is_expected.to respond_to(:touch_in) }
let (:station) {double :station}
let (:entry_station) {double :entry_station}
let (:exit_station) {double :exit_station}
#let (:journey) { {entry_station: entry_station, exit_station: exit_station} }


	describe '#initalize' do
		it 'has a default balance of £0' do
			expect(card.balance).to eq(0)
	  end
	end

	describe '#top_up' do

		it 'allows putting money on oystercard' do
			expect{card.top_up(3)}.to change{card.balance}.by(3)
		end
		it "can only top up to a maximum of £90" do
			max_balance = Oystercard::MAX_BALANCE
			card.top_up(max_balance)
			expect{card.top_up(6)}.to raise_error "Can't top up over £#{max_balance}"
		end
	end
  # describe '#deduct_fare' do
  #   it "checks to see if card fare is deducted from balance" do
  #     card.top_up(50)
  #     expect{card.deduct_fare(5)}.to change{card.balance}.by(-5)
  #   end
  #   it "raises error if fare exceeds balance" do
  #     expect{card.deduct_fare(5)}.to raise_error "Not enough credit on card"
  #   end
  # end
    describe '#touch_in' do


      before {card.top_up(50)}
      # it "raises error if touched in twice" do
      #   card.touch_in(station)
      #   expect{card.touch_in(station)}.to raise_error "card already in journey"
      # end
      # it "raises error if balance below £#{Oystercard::MIN_FARE}" do
      #   card.deduct_fare(49.50)
      #   expect{card.touch_in}.to raise_error "not enough money on the card min balance of £#{Oystercard::MIN_FARE}"
      # end
      # it "stores the station we pass" do
      #   card.touch_in(entry_station)
      #   expect(card.entry_station).to eq entry_station
      # end

    describe '#touch_out' do
      before{card.touch_in(entry_station)}
      # it "touches out" do
      #   card.touch_out(exit_station)
      #   expect(card.in_journey?).to be_falsey
      # end
      it "deducts minimum fare" do
        expect{card.touch_out(exit_station)}.to change{card.balance}.by(-Oystercard::MIN_FARE)
      end
    end
  #   describe '#journeys' do
  #     it "the storage for journeys will be empty at the beginning" do
  #       expect(card.journeys).to be_empty
  #     end
  #     it "stores the journey into the journeys variable" do
  #        card.touch_in(entry_station)
  #        card.touch_out(exit_station)
  #        expect(card.journeys).to include journey
  #     end
  #   end
    end
end

>>>>>>> f71b9cf137f845cf11262e97ff1d48b1eedf9cd0
