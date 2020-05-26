require 'rails_helper'
RSpec.describe "add User", :type => :feature do
  it "User 'John Doe' is registred in the application" do
    user_1 = FactoryBot.create(:user)
    visit "/login"
    fill_in "user[name]", with: user_1.username
    fill_in "user[password]", with: user_1.password
    click_button "Log In"
    expect(page).to have_content("Welcome back, #{user_1.username}!")
  end
end