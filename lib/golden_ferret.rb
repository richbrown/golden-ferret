module GoldenFerret	
		class << self
			attr_accessor :idol_ip_address, :protocol

			def configure
				yield self	
			end

			def idol_url
				"#{protocol}://#{idol_ip_address}/"				
			end
		end
end
