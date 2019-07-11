require "rails_helper"

RSpec.feature "Post management", :type => :feature do
  let(:user) { create :user }
  let(:user2) { create :user }
  
  scenario "User not logged in" do
    visit "/friend_requests"
    expect(page).to have_text("Log in")
  end

  scenario "User logged in" do
  	login_as(user, :scope => :user)
    visit "/friend_requests"
    expect(page).to have_text("Logout")
  end

  scenario "User clicks on 'Send friend request' on user show page" do
  	login_as(user, :scope => :user)
    visit user_path(user2)
    click_button "Send friend request"
    expect(page).to have_button('Cancle friend request')
  end

end