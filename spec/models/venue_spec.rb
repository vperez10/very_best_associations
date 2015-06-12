require 'rails_helper'

describe Venue do
  describe "associations" do
    it("does something", points: 5) { should belong_to(:neighborhood) }
    it("does something", points: 5) { should have_many(:favorites) }
  end

  describe "validations" do
    it("does something", points: 5) { should validate_uniqueness_of(:name).scoped_to(:address) }
    it("does something", points: 5) { should validate_presence_of(:name) }
    it("validates", points: 5) { should validate_presence_of(:neighborhood_id) }
  end
end
