class UsersController < ApplicationController
	before_action :authenticate_user!, only: [:show]
	before_action :user_allowed?, only: [:show]

  def show
  	@user = User.find(params[:id])
  end

  private

  def user_allowed?
  	unless current_user == User.find(params[:id])
  		flash[:danger] = "You are not allowed to do that"
  		redirect_to root_path
  	end
  end
end
