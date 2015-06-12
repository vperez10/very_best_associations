require 'rails_helper'

describe Neighborhood do
  describe "associations" do
    it("does something", points: 5) { should have_many(:venues) }
  end

  describe "validations" do
    it("does something", points: 5) { should validate_uniqueness_of(:name).scoped_to(:city) }
    it("does something", points: 5) { should validate_presence_of(:name) }
  end
end
