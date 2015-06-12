require 'rails_helper'

describe Favorite do
  describe "associations" do
    it("belongs to user", points: 10) { should belong_to(:user) }
    it("belongs to dish", points: 10) { should belong_to(:dish) }
    it("belongs to venue", points: 10) { should belong_to(:venue) }
  end

  describe "validations" do
    it("validates presence of user_id", points: 10) { should validate_presence_of(:user_id) }
    it("validates presence of dish_id", points: 10) { should validate_presence_of(:dish_id) }
    it("validates presence of venue_id", points: 10) { should validate_presence_of(:venue_id) }
  end
end
