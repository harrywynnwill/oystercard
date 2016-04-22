class JourneyLog
  def initialize(journey_class=Journey)
    @current_journey={}
    @journey_log = []
    @journey_class=journey_class.new
  end

  def start(station)
    @current_journey[:entry_station]=station
  end
  def finish(station)
    @current_journey[:exit_station]=station
    @journey_log << @current_journey
    @current_journey = {}
  end
  def journey_log
    @journey_log
  end
  def current_journey
    @current_journey
  end
  def fetch_fare
    @journey_class.fare
  end

  def complete?
    (current_journey.has_key?(:entry_station) && current_journey.has_key?(:exit_station)) || current_journey.empty?
     end
end