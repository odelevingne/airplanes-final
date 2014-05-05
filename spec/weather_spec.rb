require 'weather'

describe 'weather' do
	
	it "can be sunny" do
		airport = Airport.new
		airport.stub(:weather?) { "Sunny!"}
		expect(airport.weather?).to eq "Sunny!"
	end
end


# airport.stub(:weather?) { "sunny"  }

# obj.stub(:message) { 'this is the value to return' }

