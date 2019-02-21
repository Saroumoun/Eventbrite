require 'spec_helper'

feature "the create event process" do
  background do
    @user = FactoryBot.create(:user)
    @event = FactoryBot.create(:event)
  end

  scenario "sign in then create event" do
    
    visit '/users/sign_in'

    within("#session") do
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
    end

    click_button 'Log in'

    click_link("Create event", :match => :first)

    within("#event") do
      fill_in 'title', with: @event.title
      fill_in 'start_date', with: @event.start_date
      fill_in 'duration', with: @event.duration
      fill_in 'description', with: @event.description
      fill_in 'price', with: @event.price
      fill_in 'location', with: @event.location
    end

    click_button 'Create'

    expect(page).to have_content 'Event successfully created'
  end
end





    # 