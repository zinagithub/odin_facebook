RSpec.feature "Signup management", :type => :feature do
  let(:user) { create :user }

  scenario "User tries to sign up without filling all data" do
    visit "/register"
    fill_in "Email", :with => "someemail@mail"
    fill_in "Password", :with => "somePassword"
    click_button "Sign up"
    expect(page).to have_text("Sign up")
  end

  scenario "User tries to log in with right credentials" do
  	visit "/register"
    fill_in "Email", :with => "someemail@mail"
    fill_in "Username", :with => "SomeUser123"
    fill_in "Password", :with => "password"
    fill_in "Password confirmation", :with => "password"
    click_button "Sign up"
    expect(page).to have_text("Logout")
  end

end