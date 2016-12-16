class SessionsController < ApplicationController
  def new
  end


  def create
		user = User.find_by(email: login_params[:email])
		if user && user.authenticate(login_params[:password])
			session[:user_id] = user.id
			redirect_to '/ideas'
		else
			flash[:errors] = ['Invalid Credentials']
			redirect_to '/sessions/new'
		end
	end

	def destroy
		reset_session
		redirect_to '/'		
		
	end

	private
	  def login_params
	  	params.require(:login).permit(:email, :password)
	  end
end
