require 'plane'

describe 'plane' do

	let(:plane) {Plane.new}

	context 'Taking off and landing' do
	
		it "should be flying when created" do
			expect(plane).to be_flying
		end

		it "should have a flying status when in the air" do
			expect(plane.flying?).to eq "Flying!"
		end

		it "should be able to land" do
			plane.land!
			expect(plane.flying?).to eq "In Airport"
		end

		it "should be able to take off" do
			plane.land!.takeoff!
			expect(plane.flying?).to eq "Flying!"
		end

	end

	context 'Raising errors for duplicate commands' do

		it "should return an error if told to take off whilst in the air" do
			plane
			expect(plane.flying?).to eq "Flying!"
			expect{ (plane.takeoff!)}.to raise_error(RuntimeError)
		end

		it "should return an error if told to land whilst already in airport" do
			plane.land!
			expect(plane.flying?).to eq "In Airport"
			expect{ (plane.land!)}.to raise_error {RuntimeError}
		end

	end

end
