require 'rails_helper'

describe Favorite do
  describe "associations" do
    it("does something", points: 5) { should belong_to(:user) }
    it("does something", points: 5) { should belong_to(:dish) }
    it("does something", points: 5) { should belong_to(:venue) }
  end

  describe "validations" do
    it("does something", points: 5) { should validate_presence_of(:user_id) }
    it("does something", points: 5) { should validate_presence_of(:dish_id) }
    it("does something", points: 5) { should validate_presence_of(:venue_id) }
  end
end
