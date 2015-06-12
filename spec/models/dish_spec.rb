require 'rails_helper'

describe Dish do
  describe "associations" do
    it("belongs to cuisine", points: 10) { should belong_to(:cuisine) }
  end

  describe "validations" do
    it("validates presence of cuisine_id", points: 10) { should validate_presence_of(:cuisine_id) }
  end
end
