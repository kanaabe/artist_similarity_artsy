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
		@current = Connection.get(params["link"])
		render '/home/show'
		# maybe render a different FINISHED page when link == session[:end_url] ?? 
	end

	def game
		# session[:start_article] = params[:starting_article]
		# session[:end_article] = params[:ending_article]
		@start_article = params[:starting_article]
	end

end