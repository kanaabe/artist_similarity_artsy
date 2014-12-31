class Connection
	
	def self.start
		@api = Hyperclient.new('https://api.artsy.net/api') do |api|
			api.headers['Accept'] = 'application/vnd.artsy-v2+json'
  		api.headers['X-Xapp-Token'] = ENV['TOKEN']
		end
	end

	def self.search(keyword)
		result = @api.search(q: keyword)
		arr = []
		result.results.each do |result|
			if result.type == "Artist" || result.type == "Artwork"
				if public?(result.self)
					arr << result
				end
			end
		end
		arr
	end

	def self.public?(link)
		begin
			link._head
		rescue
			return false
		end
		true
	end

	def self.get(link)
		@result = Hyperclient.new(link) do |api|
			api.headers['Accept'] = 'application/vnd.artsy-v2+json'
  		api.headers['X-Xapp-Token'] = ENV['TOKEN']
		end
	end

	def self.reformat(blurb)
		links = blurb.scan(/\[.*?\]\(.*?\)/)
		links.each do |word|
			url = word.match(/\(.*\)/)[0].gsub(/[\(\)]/,"").gsub("gene","genes").gsub("artist","artists")
			text = word.match(/\[.*\]/)[0].gsub(/[\[\]]/,"")
			blurb = blurb.gsub(word,"<a href='/show?link=https://api.artsy.net/api#{url}'>#{text}</a>")
		end
		blurb
	end

	def self.getId(url)
		self.get(url)._response.body["id"]
	end
	
end








