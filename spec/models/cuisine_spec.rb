require 'rails_helper'

describe Cuisine do
  describe "associations" do
    it("does something", points: 5) { should have_many(:dishes) }
  end

  describe "validations" do
    it("does something", points: 5) { should validate_uniqueness_of(:name) }
    it("does something", points: 5) { should validate_presence_of(:name) }
  end
end
