class LikesController < ApplicationController

	def create
		Like.create(
			idea: Idea.find(params[:id]),
			user: current_user
			)
		redirect_to '/ideas'
	end

end
