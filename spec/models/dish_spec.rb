require 'rails_helper'

describe Dish do
  describe "associations" do
    it { should belong_to(:cuisine) }
  end

  describe "validations" do
    it { should validate_presence_of(:cuisine_id) }
  end
end
