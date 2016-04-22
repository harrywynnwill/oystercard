require 'journeylog'
describe JourneyLog do
  it{is_expected.to respond_to(:start)}
  it{is_expected.to respond_to(:finish)}
  it{is_expected.to respond_to(:journey_log)}
  it{is_expected.to respond_to(:current_journey)}


end