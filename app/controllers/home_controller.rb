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
		params["link"].include?("genes") ? linkridden = @current.description : linkridden = @current.blurb
		@blurb = Connection.reformat(linkridden).html_safe
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

end