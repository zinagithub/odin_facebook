require "rails_helper"

RSpec.feature "Login management", :type => :feature do
  let(:user) { create :user }

  scenario "User tries to log in with wrong credentials" do
    visit "/login"
    fill_in "Email", :with => "wrongUser"
    fill_in "Password", :with => "wrongPassword"
    click_button "Log in"
    expect(page).to have_text("Log in")
  end

  scenario "User tries to log in with right credentials" do
  	visit "/login"
    fill_in "Email", :with => user.email
    fill_in "Password", :with => "password"
    click_button "Log in"
    expect(page).to have_text("Logout")
  end

  # scenario "User clicks on 'Send friend request' on user show page" do
  # 	login_as(user, :scope => :user)
  #   visit user_path(user2)
  #   click_button "Send friend request"
  #   expect(page).to have_button('Cancle friend request')
  # end

end