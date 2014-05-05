class Plane

def initialize
	@flying = true
end

def flying?
	if @flying == true
		return "Flying!"
	else 
		return "In Airport"
	end
end

def land!
	@flying = false
end

def takeoff!
	@flying = true
end

end
