require 'spec_helper'

describe Request do
	before :each do
		@request = Request.new
	end

	it "forms the path of the request" do
		@request[:action] = "query"
		@request[:text] = "dave"

		@request.path.should eql "?action=query&text=dave"
	end

	it "allows getting and setting of a param value" do
		@request[:action] = "dave"
		@request[:action].should eql "dave"
	end

end
