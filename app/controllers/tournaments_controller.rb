class TournamentsController < ApplicationController

	def index
		@tournaments = current_user.tournaments

	end

	def show
		@tournament = Tournament.find(params[:id])
	end
end
