require 'rails_helper'
RSpec.describe "admin delete review", :type => :feature do
  it "User 'vgdb_admin' login on to application's settings page and delete review on game 'Test game' made by user 'test_user'" do
    admin = FactoryBot.create(:user, :username => "vgdb_admin", :password => "labassi2020", :email => "admin@mail", :id => 0)
    user = FactoryBot.create(:user)
    game = FactoryBot.create(:game)
    review = FactoryBot.create(:review, :user_id => user.id, :game_id => game.id)
    page.set_rack_session(user_id: admin.id)
    visit "/settings"
    expect(page).to have_content("Admin control panel")
    expect(page).to have_content("#{user.username}")
    expect(page).to have_content("#{game.title}")
    click_link "Delete reviews from user"
    expect(page).to have_content("Delete reviews from user")
    fill_in "user[name]", with: user.username
    fill_in "game[title]", with: game.title
    click_button "delete"
    expect(page).to have_content("Operation completed")
    click_link "×"
    expect(page).not_to have_content("#{game.title}")
  end
end
