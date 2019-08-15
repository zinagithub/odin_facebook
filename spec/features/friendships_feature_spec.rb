require "rails_helper"

RSpec.feature "Friendships management", :type => :feature do
  let(:user) { create :user }
  let(:friend) { create :user }
  let(:friendship) { create(:friendship, user_id: user.id, friend_id: friend.id) }
  
  scenario "Visiting friends page" do
    login_as(user, :scope => :user)
    visit "/friendships"
    expect(page).to have_text('Friend')
  end

end