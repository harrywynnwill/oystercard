
class Journey
  PENALTY_FARE = 6
  MIN_FARE = 1
  attr_reader :entry_station, :exit_station, :current_journey

  def initialize
  @current_journey={}
  end
  def start(station)
  #  @entry_station = station
    @current_journey[:entry_station]=station
  end

  def finish(station)
  #  @exit_station=station
    @current_journey[:exit_station]=station
  end

  def complete?
      (current_journey.has_key?(:entry_station) && current_journey.has_key?(:exit_station)) || current_journey.empty?
    # (@exit_station && @entry_station) || current_journey.empty?
  end

  def en_route?
     current_journey.has_key?(:entry_station) && !current_journey.has_key?(:exit_station)
  end

  def fare
    complete? ? MIN_FARE : PENALTY_FARE
  end

  private

  def caculate_penalty?

  end
end
