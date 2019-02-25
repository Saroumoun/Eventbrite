class Admin::AdminController < ApplicationController
	before_action :authenticate_user!
  before_action :check_if_admin

  def index
  end

  private

  	def check_if_admin
  		unless current_user.is_admin
	      flash[:danger] = "You are not admin"
	      redirect_back(fallback_location: root_path)
    	end
    end
end


