require 'rails_helper'

describe Neighborhood do
  describe "associations" do
    it("has_many venues", points: 10) { should have_many(:venues) }
  end

  describe "validations" do
    it("validates uniqueness of name/city combination", points: 20) { should validate_uniqueness_of(:name).scoped_to(:city) }
    it("validates presence of name", points: 10) { should validate_presence_of(:name) }
  end
end
