class Admin::UsersController < ApplicationController
	before_action :authenticate_user!
  before_action :check_if_admin

	def index
    @users = User.all.sort
  end

  def edit
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(
      first_name: params[:first_name],
      last_name: params[:last_name],
      description: params[:description]
      )
      if params[:is_admin].present?
        @user.update(is_admin: params[:is_admin])
      end

      flash[:notice] = "User's info were updated"
      redirect_to admin_users_path
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "User succesfully deleted"
    redirect_to admin_users_path
  end
  

  private

  	def check_if_admin
  		unless current_user.is_admin
	      flash[:danger] = "You are not admin"
	      redirect_back(fallback_location: root_path)
    	end
    end
end
