require 'spec_helper'

describe GoldenFerret do
	
	it "returns itself do allow block config" do
		GoldenFerret.configure do |config|
			config.idol_ip_address = "123.456.789.10"
		end

		GoldenFerret.idol_ip_address.should eql "123.456.789.10"
	end

	it "builds the URL for the idol server" do
		GoldenFerret.configure do |config| 
			config.idol_ip_address = "123.456.789.10"
			config.protocol = "http"			
		end

		GoldenFerret.idol_url.should eql "http://123.456.789.10/"
	end
end
