class Admin::EventsController < ApplicationController
	before_action :authenticate_user!
  before_action :check_if_admin

	def index
    @events = Event.all.where(validated: nil)
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if params[:validated].present?
      @event.update(validated: params[:validated])
      
      flash[:notice] = "Event has been validated"
      redirect_to admin_events_path
    else
      render :edit
    end
  end

  def destroy
  	@event = Event.find(params[:id])
  	@event.destroy
    flash[:notice] = "Event has been deleted"
    redirect_to admin_events_path
  end


  private

  	def check_if_admin
  		unless current_user.is_admin
	      flash[:danger] = "You are not admin"
	      redirect_back(fallback_location: root_path)
    	end
    end
end
