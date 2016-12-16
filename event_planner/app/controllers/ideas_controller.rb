class IdeasController < ApplicationController
  def index
  	# @ideas = Idea.all.includes(:likes, :users, :user)
  	@ideas = Idea.all.includes(:likes, :users, :user).order("count(likes.id) DESC")
  	
  end

  def show
  	@idea = Idea.find(params[:id])
  end


  def create
		idea = Idea.new(
		  idea_params.merge({
			user: current_user
			})
		)
		if idea.save
	  		
	  		redirect_to "/ideas"
	  	else
	  		flash[:errors] = idea.errors.full_messages
	  		redirect_to "/ideas"
	  	end
  	
	end




	private
      def idea_params
      	params.require(:idea).permit(:content) 
			
	  end
end
