require 'airport' 

describe 'airport' do

	let(:airport) {Airport.new}
	let(:plane) {double :plane}

	it "should be created with no planes" do
		expect(airport.plane_count).to eq []
	end	

	it "can have a plane land" do
		expect(plane).to receive(:land!)
		airport.clear_to_land(plane)
		expect(airport.plane_count).to eq [plane]
	end

	it "can have a plane take off" do
		expect(plane).to receive(:land!)
		airport.clear_to_land(plane)
		expect(airport.plane_count).to eq [plane]
		expect(plane).to receive(:takeoff!)
		airport.clear_to_takeoff(plane)
		expect(airport.plane_count).to eq []
	end


end
