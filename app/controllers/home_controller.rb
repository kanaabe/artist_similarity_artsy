class HomeController < ApplicationController

	def index
		render 'index.html'
	end

	def search
		@connection = Connection.start
		@start_results = Connection.search(params["artwork_keyterm"])
		@goal_results = Connection.search(params["artwork_keyterm_goal"])
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

	def game

	end

	def gamesetup
		render 'game'
	end

end