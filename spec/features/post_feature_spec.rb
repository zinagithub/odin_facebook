require "rails_helper"

RSpec.feature "Post management", :type => :feature do
  let(:user) { create :user }
  
  scenario "User not logged in" do
    visit "/posts"
    expect(page).to have_text("Log in")
  end

  scenario "User logged in" do
  	login_as(user, :scope => :user)
    visit "/posts"
    expect(page).to have_text("Logout")
  end

  scenario "User creates post" do
  	login_as(user, :scope => :user)
    visit "/posts"
    click_link "New Post"
    fill_in "Body", :with => "My First Post"
    click_button "Submit"
    expect(page).to have_text("My First Post")
  end

  scenario "User likes post" do
  	login_as(user, :scope => :user)
    visit "/posts/new"
    fill_in "Body", :with => "My First Post"
    click_button "Submit"
    click_button("like")
    expect(page).to have_text("Liked by 1 user")
  end

  scenario "User likes post" do
  	login_as(user, :scope => :user)
    visit "/posts/new"
    fill_in "Body", :with => "My First Post"
    click_button "Submit"
    click_button("like")
    click_button("unlike")
    expect(page).to have_text("Liked by 0 users")
  end

end