class HomeController < ApplicationController

	def index
		render 'index.html'
	end

	def search
		Connection.start
		@start_results = Connection.search(params["artwork_keyterm"])
		@goal_results = Connection.search(params["artwork_keyterm_goal"])
		render '/home/search_result'
	end

	def show
		@current = Connection.get(params["link"])
		# genres have descriptions, artworks have blurbs, artists have none (as of 1/26).
		linkridden = @current.description if params["link"].include?("genes")
		linkridden = @current.blurb if params["link"].include?("artworks")
		linkridden = "" if params["link"].include?("artists")
		@blurb = Connection.reformat(linkridden).html_safe

		# set page types
		@type = "artist" if params["link"].include?("artists")
		@type = "artwork" if params["link"].include?("artworks")
		@type = "gene" if params["link"].include?("genes")
		
		render '/home/show'
	end

	def game
		@start_article = params[:starting_article]
		@end_id = Connection.getId(params[:ending_article])
	end

	def end
	end

	def results
	end

end