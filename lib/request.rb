class Request

	def initialize
		@params = {}
	end

	def path
		result = "?"
		@params.each_with_index do |param, index|
			result += "&" unless index == 0
			result += "#{param[0]}=#{param[1]}"
		end
		result	
	end

	def []=(key, value)
		@params[key] = value
	end

	def [](key)
		@params[key]
	end
end
