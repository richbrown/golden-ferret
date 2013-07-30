require 'spec_helper'

describe Responses::Query do	
	before :each do
		@query = Responses::Query.new
		@query.body = fakes_ml
		@query.parse
	end

	it "builds hits from the XML defined" do
		@query.hits.count.should eql 6
		@query.hits[0][:title].should eql "Alistair Burt MP visits the School of Government and Society"
	end

	it "parses the response" do
		@query.response.should eql "SUCCESS"
	end
	
	it "parses the number of hits" do
		@query.number_of_hits.should eql 6
	end

	it "parses the total number of hits" do
		@query.total_hits.should eql 465
	end

	def fakes_ml
	'<autnresponse xmlns:autn="http://schemas.autonomy.com/aci/">
	<action>QUERY</action>
	<response>SUCCESS</response>
	<responsedata>
	<autn:numhits>6</autn:numhits>
	<autn:totalhits>465</autn:totalhits>
	<autn:totaldbdocs>46802</autn:totaldbdocs>
	<autn:totaldbsecs>83017</autn:totaldbsecs>
	<autn:qmsstate>0</autn:qmsstate>
	<autn:hit>
	<autn:reference>
	http://www.birmingham.ac.uk/schools/government-society/news/school-wide/2012/03/alistair-burt.aspx
	</autn:reference>
	<autn:id>674614</autn:id>
	<autn:section>0</autn:section>
	<autn:weight>88.84</autn:weight>
	<autn:links>ALISTAIR</autn:links>
	<autn:database>Website</autn:database>
	<autn:title>
	Alistair Burt MP visits the School of Government and Society
	</autn:title>
	</autn:hit>
	<autn:hit>
	<autn:reference>
	http://www.birmingham.ac.uk/schools/biosciences/our-students/keen-alistair.aspx
	</autn:reference>
	<autn:id>674232</autn:id>
	<autn:section>0</autn:section>
	<autn:weight>88.84</autn:weight>
	<autn:links>ALISTAIR</autn:links>
	<autn:database>Website</autn:database>
	<autn:title>Alistair Keen, BSc Biological Sciences (Zoology)</autn:title>
	</autn:hit>
	<autn:hit>
	<autn:reference>
	http://www.birmingham.ac.uk/schools/government-society/departments/russian-east-european-studies/news/school-wide-child/2012/03/alistair-burt.aspx
	</autn:reference>
	<autn:id>545379</autn:id>
	<autn:section>0</autn:section>
	<autn:weight>88.84</autn:weight>
	<autn:links>ALISTAIR</autn:links>
	<autn:database>Website</autn:database>
	<autn:title>
	Alistair Burt MP visits the School of Government and Society
	</autn:title>
	</autn:hit>
	<autn:hit>
	<autn:reference>
	http://www.birmingham.ac.uk/staff/profiles/dentistry/james-alistair.aspx
	</autn:reference>
	<autn:id>492458</autn:id>
	<autn:section>0</autn:section>
	<autn:weight>88.84</autn:weight>
	<autn:links>ALISTAIR</autn:links>
	<autn:database>Website</autn:database>
	<autn:title>Mr Alistair James BDS MSc MFGDP(UK)</autn:title>
	</autn:hit>
	<autn:hit>
	<autn:reference>
	http://www.birmingham.ac.uk/schools/government-society/departments/political-science-international-studies/news/2012/02/alistair-darling-visit.aspx
	</autn:reference>
	<autn:id>465574</autn:id>
	<autn:section>1</autn:section>
	<autn:weight>88.84</autn:weight>
	<autn:links>ALISTAIR</autn:links>
	<autn:database>Website</autn:database>
	<autn:title>Alistair Darling MP visits POLSIS</autn:title>
	</autn:hit>
	<autn:hit>
	<autn:reference>
	http://www.birmingham.ac.uk/schools/government-society/departments/political-science-international-studies/news/2012/02/alistair-darling-visit.aspx
	</autn:reference>
	<autn:id>465573</autn:id>
	<autn:section>0</autn:section>
	<autn:weight>88.84</autn:weight>
	<autn:links>ALISTAIR</autn:links>
	<autn:database>Website</autn:database>
	<autn:title>Alistair Darling MP visits POLSIS</autn:title>
	</autn:hit>
	</responsedata>
	</autnresponse>'
	end
end

