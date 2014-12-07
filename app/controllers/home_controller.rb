class HomeController < ApplicationController

	def index
		render 'index.html'
	end

	def search
		@results = Connection.search(params["artwork_keyterm"])
		render '/home/search_result'
	end

	def show
		@current = Connection.get(params["link"],params["type"])
		if params["type"] == "Artist"
			render '/home/show_artist'
		else
			render '/home/show_artwork'
		end
	end

end