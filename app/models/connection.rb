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
				arr << result
			end
		end
		arr
	end

	# def self.get(link,type)
	# 	@result = Hyperclient.new(link) do |api|
 #  		api.headers['Accept'] = 'application/vnd.artsy-v2+json'
 #  		api.headers['X-Xapp-Token'] = ENV['TOKEN']
	# 	end
	# end
	
	
end