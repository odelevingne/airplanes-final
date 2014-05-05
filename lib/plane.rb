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
	raise "I'm already flying!" if @flying == true
	@flying = true
	self
end

end
