require "rails_helper"
RSpec.describe Game, :type => :model do
  
  before(:all) do
    @game1 = create(:game)
  end
  
  it "is valid with valid attributes" do
    expect(@game1).to be_valid
  end
  
  it "has a unique title" do
    game2 = build(:game, serial: 0)
    expect(game2).to_not be_valid
  end
  
  it "has a unique serial" do
    game2 = build(:game, title: "example_title")
    expect(game2).to_not be_valid
  end
  
  it "is not valid without a title" do 
    game2 = build(:game, title: nil)
    expect(game2).to_not be_valid
  end
  
  it "is not valid without a serial" do 
    game2 = build(:game, serial: nil)
    expect(game2).to_not be_valid
  end
  
end