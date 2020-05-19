require "rails_helper"
RSpec.describe Review, :type => :model do
  
  before(:all) do
    @review1 = create(:review)
  end
  
  it "is valid with valid attributes" do
    expect(@review1).to be_valid
  end
  
  it "is unique" do
    review2 = build(:review, user_id: 0, game_id: 0)
    expect(review2).to_not be_valid
  end
  
  #it "is not valid without a user_id" do 
  #  review2 = build(:review, user_id: nil)
  #  expect(review2).to_not be_valid
  #end
  
  #it "is not valid without a game_id" do 
  #  review2 = build(:review, game_id: nil)
  #  expect(review2).to_not be_valid
  #end
  
end