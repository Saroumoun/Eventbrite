class AttendancesController < ApplicationController
	def index
		@event = Event.find(params[:event_id])
		@attendances = @event.attendees
	end 

	def new
  	@event = Event.find(params[:event_id])
  	@attendance = Attendance.new
  end

  def create
  	@event = Event.find(params[:event_id])

	  @amount = @event.price * 100

	  customer = Stripe::Customer.create(
	    :email => params[:stripeEmail],
	    :source  => params[:stripeToken]
	  )

	  charge = Stripe::Charge.create(
	    :customer    => customer.id,
	    :amount      => @amount,
	    :description => 'Rails Stripe customer',
	    :currency    => 'eur'
	  )

	  @attendance = Attendance.create(stripe_customer_id: charge[:customer], attendee: current_user, event: @event) unless charge[:customer].nil?
	  flash[:notice] = "You are now registred for this event"
	  redirect_to @event

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_event_attendance_path(@event.id)
	end
end
