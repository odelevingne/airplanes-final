require 'airport' 

describe 'airport' do

	let(:airport) {Airport.new}
	let(:plane) {double :plane, land!: :plane, takeoff!: :plane}

	context "planes taking off and landing" do

		it "should be created with no planes" do
			expect(airport.plane_count).to eq []
		end	

		it "can have a plane land" do
			expect(plane).to receive(:land!)
			airport.clear_to_land(plane)
			expect(airport.plane_count).to eq [plane]
		end

		it "can have a plane take off" do
			# expect(plane).to receive(:land!)
			airport.clear_to_land(plane)
			# expect(airport.plane_count).to eq [plane]
			# expect(plane).to receive(:takeoff!)
			airport.clear_to_takeoff(plane)
			expect(airport.plane_count).to eq []
		end
	end

	context "air traffic control" do

		it "should have a capacity" do
			expect(airport.capacity).to eq (Airport::DEFAULT_CAPACITY)
		end

		it "should know if it's full" do

		end

	end



end
