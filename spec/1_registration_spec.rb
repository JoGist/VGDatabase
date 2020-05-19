require 'rails_helper'
RSpec.describe "home page", :type => :feature do
  it "displays the user's username after successful login" do
    user = User.create!(:username => "jdoe", :password => "secret", :avatar => "Avatars/avatar_0")
    visit "/login"
    fill_in "user[name]", with: user.username
    fill_in "user[password]", with: user.password
    click_button "Log In"
    expect(page).to have_content("Welcome back, #{user.username}!")
    click_link "My library"
    expect(page).to have_content("You don't have any games in your library")
  end
end