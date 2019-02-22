require 'rails_helper'

RSpec.describe "events/show.html.erb", type: :view do
	#you need to add config.include Devise::Test::ControllerHelpers, type: :view in your rails_helper to get rid off device/warder error
	it 'displays the title' do
    assign(:event, @event = FactoryBot.create(:event))
    render
    expect(rendered).to match(@event.title)
  end

 	it 'displays the description' do
    assign(:event, @event = FactoryBot.create(:event))
    render
    expect(rendered).to match(@event.description)
  end

  it 'displays the start_date' do
    assign(:event, @event = FactoryBot.create(:event))
    render
    expect(rendered).to match(@event.start_date)
  end

  it 'displays the price' do
    assign(:event, @event = FactoryBot.create(:event))
    render
    expect(rendered).to match(@event.price.to_s)
  end

  it 'displays the location' do
    assign(:event, @event = FactoryBot.create(:event))
    render
    expect(rendered).to match(@event.location)
  end

  describe "register button" do
   	context "with sign in user" do
	  	it 'displays the register button' do
	  		@user = FactoryBot.create(:user)
	  		sign_in @user
	  		assign(:event, @event = FactoryBot.create(:event))
	  		render
	    	expect(rendered).to match("Register for this event")
	    end
  	end

    context "with log out user" do
	  	it 'does not display the button register' do
	  		@user = FactoryBot.create(:user)
	  		assign(:event, @event = FactoryBot.create(:event))
	  		render
	    	expect(rendered).to_not match("Register for this event")
	    end
	  end

	  context "with sign in event's owner " do
	  	it 'does not display the button register' do
	  		@admin = FactoryBot.create(:user)
	  		sign_in @admin
	  		@event = Event.create(
	  			title: Faker::Beer.name,
    			description: Faker::Lorem.paragraph, 
    			start_date: Faker::Date.forward(30),
    			duration: 5 * rand(1..10),
    			price: rand(1..1000),
    			location: Faker::Address.city,
    			admin: @admin
	  			)

	  		assign(:event, @event)
	  		render
	    	expect(rendered).to_not match("Register for this event")
	    end
	  end

	  context "with sign in user who already registred " do
	  	it 'does not display the button register' do
	  		@user = FactoryBot.create(:user)
	  		sign_in @user

	  		@event = FactoryBot.create(:event)

	  		@attendance = Attendance.create(
	  			stripe_customer_id: SecureRandom.urlsafe_base64,
    			attendee: @user,
  				event: @event
	  			)
	  	

	  		assign(:event, @event)
	  		render
	    	expect(rendered).to_not match("Register for this event")
	    end
	  end
  end  
end