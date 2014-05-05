require 'weather'

class Airport

	include Weather

	DEFAULT_CAPACITY = 6

def initialize(capacity = DEFAULT_CAPACITY)
	@capacity = capacity
	@plane_count = []

end

def plane_count
		@plane_count
end

def clear_to_land(plane)
		raise "Airport closed, it's too damn stormy!" if weather? == "Stormy!"
		raise "Airport is full! Find somewhere else!" if full?
		plane.land!
		@plane_count << plane
end

def clear_to_takeoff(plane)
		raise "You can't take off in this weather, are you mad?!" if weather? == "Stormy!"
		plane.takeoff!
		@plane_count.delete(plane)
end

def capacity
		@capacity
end

def full?
		plane_count.count == @capacity
end

end