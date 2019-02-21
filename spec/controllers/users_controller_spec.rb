require 'rails_helper'

RSpec.describe UsersController, type: :controller do



	describe "GET show" do
	  it "assigns @user" do
	  	user = FactoryBot.create(:user)
		  sign_in user

	  	get :show, params: { id: user.id }
	    expect(assigns(:user)).to eq(user)
	  end

		it "renders the show template" do
			user = FactoryBot.create(:user)
		  sign_in user

		  get :show, params: { id: user.id }
	    expect(response).to render_template("show")
  	end

  	it "does not render the show template if user is not sign in" do
  		user = FactoryBot.create(:user)

		  get :show, params: { id: user.id }

		  expect(response).to_not render_template("show")
		end
		
		it "does not render the show template of another user" do
  		user = FactoryBot.create(:user)
  		sign_in user

  		user2 = FactoryBot.create(:user)	
  		

		  get :show, params: { id: user2.id }

		  expect(response).to_not render_template("show")
		end
  end
end
