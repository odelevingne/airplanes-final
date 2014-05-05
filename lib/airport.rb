class Airport

def initialize
	@plane_count = []
end

def plane_count
		@plane_count
end

def clear_to_land(plane)
		plane.land!
		@plane_count << plane
end

end