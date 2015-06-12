require 'rails_helper'

describe Venue do
  describe "associations" do
    it("belongs to neighborhood", points: 10) { should belong_to(:neighborhood) }
    it("has many favorites", points: 10) { should have_many(:favorites) }
  end

  describe "validations" do
    it("validates uniqueness of name/address combination", points: 10) { should validate_uniqueness_of(:name).scoped_to(:address) }
    it("validates presence of name", points: 10) { should validate_presence_of(:name) }
    it("validates presence of neighborhood_id", points: 10) { should validate_presence_of(:neighborhood_id) }
  end
end
