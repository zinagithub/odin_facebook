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

end