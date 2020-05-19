require 'rails_helper'
RSpec.describe "add Friend", :type => :feature do
  it "User 'John Doe' login and add user 'rspec_user' as friend" do
    user_1 = FactoryBot.create(:user)
    user_2 = FactoryBot.create(:user, :username => "rspec_user", :email => "mail_2@example.com")
    visit "/login"
    fill_in "user[name]", with: user_1.username
    fill_in "user[password]", with: user_1.password
    click_button "Log In"
    expect(page).to have_content("Welcome back, #{user_1.username}!")
    click_link "Search"
    expect(page).to have_content("Games search")
    click_link "Users"
    expect(page).to have_content("Users search")
    fill_in "username", with: user_2.username
    click_button "search"
    expect(page).to have_content("#{user_2.username}'s profile")
    click_link "Add to friends"
    expect(page).to have_content("Remove from friends")
    click_link "Friends"
    expect(page).to have_content("You have 1 friend")
  end
end