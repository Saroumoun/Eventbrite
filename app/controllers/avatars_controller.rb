class AvatarsController < ApplicationController
	def new
		@event = Event.find(params[:event_id])
	end
	def create
		@event = Event.find(params[:event_id])
    @event.avatar.attach(params[:avatar])
    redirect_to @event
	end
end
