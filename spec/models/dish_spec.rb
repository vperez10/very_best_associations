require 'rails_helper'

describe Dish do
  describe "associations" do
    it("does something", points: 5) { should belong_to(:cuisine) }
  end

  describe "validations" do
    it("does something", points: 5) { should validate_presence_of(:cuisine_id) }
  end
end
