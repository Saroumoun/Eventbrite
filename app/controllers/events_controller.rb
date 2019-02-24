class EventsController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create]
  before_action :user_allowed?, only: [:edit, :update, :destroy]

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
  	@event = Event.new(event_params)
    @event.admin = current_user

  	if @event.save
      flash[:notice] = "Event successfully created"
      redirect_to @event
    else
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    puts "-_"
    puts params
    puts "-_"

    @event = Event.find(params[:id])
    
    if @event.update(
      title: params[:title], 
      description: params[:description],
      start_date: params[:start_date],
      duration: params[:duration],
      price: params[:price],
      location: params[:location]
      )
      flash[:notice] = "Event successfully updated"
      redirect_to @event
    else
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])

    @event.destroy

    flash[:notice] = "Event successfully deleted"
    redirect_to root_path
  end

  private

    def user_allowed?
      unless current_user == Event.find(params[:id]).admin
        flash[:danger] = "You are not allowed to do that"
        redirect_to root_path
      end
    end

    def event_params
      params.permit(:title, :description, :start_date, :duration, :price, :location, avatar: [])
    end
end
