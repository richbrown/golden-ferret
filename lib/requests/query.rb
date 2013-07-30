require 'nokogiri'
require 'ostruct'

module Responses
	class Query < Response
		attr_reader :hits, :response, :number_of_hits, :total_hits

		def initialize
			@hits = []
		end

		def parse
			doc = Nokogiri::HTML(body)
			parse_hits(doc)
			@response = doc.css('response').text
			@number_of_hits = doc.css('numhits').text.to_i
			@total_hits = doc.css('totalhits').text.to_i
			super
		end

		private 

		def parse_hits(doc)	
			doc.css('responsedata hit').each do |hit_node|
				hit = {}
				hit_node.children.each do |child_node|
					hit[child_node.name.to_sym] = child_node.text.strip					
				end
				@hits << hit
			end
		end

	end
end
