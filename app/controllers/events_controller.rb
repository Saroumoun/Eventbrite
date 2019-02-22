class EventsController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create]

  def index
  	@events = Event.all
  end
  def show
  	@event = Event.find(params[:id])
  end
  def new
  	@event = Event.new
  end
  def create
  	@event = Event.new(
  		title: params[:title],
  		description: params[:description], 
  		start_date: params[:start_date], 
  		duration: params[:duration].to_i,
  		price: params[:price].to_i,
  		location: params[:location],
  		admin: current_user
  	)

  	if @event.save
      flash[:notice] = "Event successfully created"
      redirect_to @event
    else
      render :new
    end
  end
  def edit 
  end
  def destroy
    @event = Event.find(params[:id])

    @event.destroy

    flash[:notice] = "Event successfully deleted"
    redirect_to root_path
  end
end
