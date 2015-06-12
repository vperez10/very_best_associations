require 'rails_helper'

describe User do
  describe "associations" do
    it("has many favorites", points: 10) { should have_many(:favorites) }
  end

  describe "validations" do
    it("valdiates uniqueness of username", points: 10) { should validate_uniqueness_of(:username) }
    it("valdiates presence of username", points: 10) { should validate_presence_of(:username) }
  end
end
