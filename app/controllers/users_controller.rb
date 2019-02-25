class UsersController < ApplicationController
	before_action :authenticate_user!, only: [:show, :edit, :update]
	before_action :user_allowed?, only: [:show, :edit, :update]

  def show
  	@user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end 

  def update
    @user = User.find(params[:id])

    if @user.update(first_name: params[:first_name], last_name: params[:last_name], description: params[:description])
      @user.profil_picture.attach(params[:profil_picture])
      flash[:notice] = "User successfully updated"
      redirect_to @user
    else
      render :edit
    end
  end 

  private

    def user_allowed?
    	unless current_user == User.find(params[:id])
    		flash[:danger] = "You are not allowed to do that"
    		redirect_to root_path
    	end
    end

end
