require 'rails_helper'

describe Cuisine do
  describe "associations" do
    it("has many dishes", points: 10) { should have_many(:dishes) }
  end

  describe "validations" do
    it("validates uniqueness of name", points: 10) { should validate_uniqueness_of(:name) }
    it("validates presence of name", points: 10) { should validate_presence_of(:name) }
  end
end
