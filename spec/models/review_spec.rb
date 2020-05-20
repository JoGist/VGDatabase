require "rails_helper"
RSpec.describe Review, :type => :model do

  it "is unique" do
    review1 = build(:review, :user_id => 1, :game_id => 1)
    expect(review1).to_not be_valid
  end

  it "is valid with valid attributes" do
    user_id = create(:user, :username => "username_prova", :email => "gibberish@mail.com", :id => 69).id
    game_id = create(:game, :serial => 54321, :title => 'ciao', :id => 420).id
    review2 = create(:review, :user_id => user_id, :game_id => game_id)
    expect(review2).to be_valid
  end

end
