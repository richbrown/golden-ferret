require 'open-uri'

class Postman
	def self.deliver(request, response)
		response.body = URI.parse(GoldenFerret.idol_url + request.path).read
		response.parse
		response
	end
end
