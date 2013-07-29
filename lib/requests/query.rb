require 'nokogiri'
require 'ostruct'

module Responses
	class Query
		attr_accessor :body
		attr_reader :hits

		def initialize
			@hits = []
		end

		def parse
			doc = Nokogiri::HTML(body)
			parse_hits(doc)
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
