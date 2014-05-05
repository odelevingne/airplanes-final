require 'airport' 

describe 'airport' do

	it "should be created with no planes" do
		airport = Airport.new
		expect(airport.plane_count).to eq []
	end	

	it "can have a plane land" do
		airport = Airport.new
		plane = double :plane
		expect(plane).to receive(:land!)
		airport.clear_to_land(plane)
		expect(airport.plane_count).to eq [plane]
	end

	it "can have a plane take off" do
		airport = Airport.new
		plane = double :plane
		expect(plane).to receive(:land!)
		airport.clear_to_land(plane)
		expect(airport.plane_count).to eq [plane]
		expect(plane).to receive(:takeoff!)
		airport.clear_to_takeoff(plane)
		expect(airport.plane_count).to eq []
	end


end
