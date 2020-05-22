require 'rails_helper'
RSpec.describe "admin delete user", :type => :feature do
  it "User 'admin' login on to application's settings page and delete user 'John Doe'" do
    admin = FactoryBot.create(:user, :username => "admin", :password => "admin", :email => "admin@mail", :id => 0)
    user = FactoryBot.create(:user)
    visit "/login"
    fill_in "user[name]", with: admin.username
    fill_in "user[password]", with: admin.password
    click_button "Log In"
    expect(page).to have_content("Admin control panel")
    expect(page).to have_content("#{user.username}")
    click_link "Delete user"
    expect(page).to have_content("Delete user")
    fill_in "user[name]", with: user.username
    click_button "delete"
    expect(page).to have_content("Operation completed")
    click_link "×"
    expect(page).not_to have_content("#{user.username}")
  end
end