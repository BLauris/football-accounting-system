class TournamentsController < ApplicationController

	load_and_authorize_resource

	def index
		@tournaments = current_user.tournaments
	end

	def show
		@tournament = Tournament.find(params[:id])
	end
end
