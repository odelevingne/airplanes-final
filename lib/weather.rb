module Weather

	def weather?
		weather = rand(1..10)
		return "Sunny!" if weather <= 7 
		return "Stormy!" if weather > 7
	end

end	