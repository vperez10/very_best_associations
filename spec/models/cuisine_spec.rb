require 'rails_helper'

describe Cuisine do
  describe "associations" do
    it { should have_many(:dishes) }
  end

  describe "validations" do
    it { should validate_uniqueness_of(:name) }
    it { should validate_presence_of(:name) }
  end
end
