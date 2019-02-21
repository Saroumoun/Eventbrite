require 'rails_helper'

RSpec.describe EventsController, type: :controller do

	describe "GET index" do
		it "assigns @events" do
	    # création d'une instance
	    event = FactoryBot.create(:event)

	    # on va sur index
	    get :index

	    # @gossips doit être une array qui contient gossip
	    expect(assigns(:events)).to eq([event])
		end
	  it "renders the index template" do
	    # va sur index
	    get :index

	    # on doit rediriger vers index
	    expect(response).to render_template("index")
	  end
	end

	describe "GET new" do
		context "with signed in user" do
	  	it "renders the new template" do
	  		user = FactoryBot.create(:user)
	  		sign_in user

		    # va sur new
		    get :new

		    # on doit rediriger vers new
		    expect(response).to render_template("new")
	  	end
	  end
	  context "with signed out user" do
	  	it "does not render the new template" do
		    # va sur new
		    get :new

		    # on doit rediriger vers new
		    expect(response).to_not render_template("new")
	  	end
	  end
	end

	describe "POST create" do
		context "with valid attributes and signed in user" do
	    it "creates a new event" do
	    	event = FactoryBot.create(:event)
	    	sign_in event.admin
	    	
	    	expect{post :create, params: {title: event.title, description: event.description, start_date: event.start_date, duration: event.duration, price: event.price, location: event.location}}.to change(Event,:count).by(1)
	    end
	    it "redirects to the new event" do
	    	event = FactoryBot.create(:event)
	    	sign_in event.admin

	      post :create, params: {title: event.title, description: event.description, start_date: event.start_date, duration: event.duration, price: event.price, location: event.location}

	      expect(response).to redirect_to Event.last
	    end
	  end

	  context "with valid attributes and signed out user" do
	    it "doest not create a new event" do
	    	event = FactoryBot.create(:event)
	    	
	    	expect{post :create, params: {title: event.title, description: event.description, start_date: event.start_date, duration: event.duration, price: event.price, location: event.location}}.to_not change(Event,:count)
	    end
	    it "re-renders the new method" do
	      event = FactoryBot.create(:event)

	      post :create, params: {title: event.title, description: event.description, start_date: event.start_date, duration: event.duration, price: event.price, location: event.location}
	      expect(response).to_not redirect_to Event.last
	    end
	  end
	end
end
