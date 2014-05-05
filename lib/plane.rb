class Plane

def initialize
	takeoff!
end

def flying?
	if @flying == true
		return "Flying!"
	else 
		"In Airport"
	end
end

def land!
	@flying = false
	self
end

def takeoff!
	@flying = true
	self
end

end
