require 'spec_helper'

describe Postman do
	before :each do
		@request = Request.new
		@response = Response.new
		GoldenFerret.stub(:idol_ip_address).and_return("123.456.789.10")
		@request.stub(:path).and_return('?action=query&text=alistair%20james&print=all')
		@http = double(URI::HTTP)
		URI.stub(:parse).and_return(@http)
		@http.stub(:read).and_return(fake_xml)
	end
	
	it "finds the IP address for the idol server from config" do
		GoldenFerret.should_receive(:idol_ip_address).and_return("123.456.789.10")
		Postman.deliver(@request, @response)
	end

	it "gets the path from the request before sending" do
		@request.should_receive(:path).and_return('?action=query&text=alistair%20james&print=all')
		Postman.deliver(@request, @response)
	end

	it "sends the request" do
		URI.should_receive(:parse).and_return(@http)
		Postman.deliver(@request, @response)
	end

	it "ensures the request to parse the response" do
		@response.should_receive(:parse)
		Postman.deliver(@request, @response)
	end

	def fake_xml
		'autnresponse xmlns:autn="http://schemas.autonomy.com/aci/">
		<action>QUERY</action>
		<response>SUCCESS</response>
		<responsedata>
		<autn:numhits>6</autn:numhits>
		<autn:qmsstate>0</autn:qmsstate>
		<autn:hit>...</autn:hit>
		<autn:hit>...</autn:hit>
		<autn:hit>...</autn:hit>
		<autn:hit>...</autn:hit>
		<autn:hit>...</autn:hit>
		<autn:hit>...</autn:hit>
		</responsedata>
		</autnresponse>'
	end

end
