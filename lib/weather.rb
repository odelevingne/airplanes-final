module Weather

	def weather?
		return "Sunny!" if rand(1..10) <= 7
		else "Stormy!"
	end

end	