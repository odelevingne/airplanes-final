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

end