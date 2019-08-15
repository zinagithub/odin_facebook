require "rails_helper"

RSpec.feature "User management", :type => :feature do
  let(:user) { create :user }
  let(:user2) { create :user }

  scenario "User not logged in" do
    visit "/users"
    expect(page).to have_text("Log in")
  end
  
  scenario "User logged in" do
    login_as(user, :scope => :user)
    visit user_path(user)
    expect(page).to have_text(user.name)
  end

  scenario "Posts display on user page" do
    login_as(user, :scope => :user)
    visit "/posts/new"
    fill_in "Body", :with => "My First Post"
    click_button "Submit"
    visit user_path(user)
    expect(page).to have_text("My First Post")
  end

end