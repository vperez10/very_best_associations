require 'rails_helper'

describe User do
  describe "associations" do
    it("does something", points: 5) { should have_many(:favorites) }
  end

  describe "validations" do
    it("does something", points: 5) { should validate_uniqueness_of(:username) }
    it("does something", points: 5) { should validate_presence_of(:username) }
  end
end
