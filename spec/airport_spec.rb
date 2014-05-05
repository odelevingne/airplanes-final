require 'airport'
require 'weather' 

describe 'airport' do

	let(:airport) {Airport.new}
	let(:plane) {double :plane, land!: :plane, takeoff!: :plane}

	context "planes taking off and landing" do

		it "should be created with no planes" do
			expect(airport.plane_count).to eq []
		end	

		it "can have a plane land" do
			airport.stub(:weather?) { "Sunny!" }
			expect(plane).to receive(:land!)
			airport.clear_to_land(plane)
			expect(airport.plane_count).to eq [plane]
		end

		it "can have a plane take off" do
			airport.stub(:weather?) { "Sunny!" }
			airport.clear_to_land(plane)
			airport.clear_to_takeoff(plane)
			expect(airport.plane_count).to eq []
		end
	end

	context "air traffic control" do

		it "should have a capacity" do
			expect(airport.capacity).to eq (Airport::DEFAULT_CAPACITY)
		end

		it "should know when it's full" do
			airport.stub(:weather?) { "Sunny!" }
			(airport.capacity.times{airport.clear_to_land(plane)})
			expect(airport.plane_count).to eq [plane, plane, plane, plane, plane, plane]
			expect(airport).to be_full
		end

		it "cannot land anymore planes when full" do
			airport.stub(:weather?) { "Sunny!" }
			(airport.capacity.times{airport.clear_to_land(plane)})
			expect(airport).to be_full
			expect{(airport.clear_to_land(plane))}.to raise_error {RuntimeError}
		end

	end

	context "weather conditions" do

		it "can be sunny" do
			airport.stub(:weather?) { "Sunny!"}
			expect(airport.weather?).to eq "Sunny!"
		end

		it "can be stormy" do
			airport.stub(:weather?) {"Stormy!"}
			expect(airport.weather?).to eq "Stormy!"
		end

		it "cannot land a plane if stormy" do
			airport.stub(:weather?) { "Stormy!" }
			expect{airport.clear_to_land(plane)}.to raise_error {RuntimeError}		
		end

		it "cannot let a plane take off if stormy" do
			airport.stub(:weather?) { "Sunny!"}
			airport.clear_to_land(plane)
			airport.stub(:weather?) { "Stormy!" }
			expect{airport.clear_to_takeoff(plane)}.to raise_error { RuntimeError}
		end
	end
	

end
