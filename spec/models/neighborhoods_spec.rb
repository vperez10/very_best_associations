require 'rails_helper'

describe Neighborhood do
  describe "associations" do
    it { should have_many(:venues) }
  end

  describe "validations" do
    it { should validate_uniqueness_of(:name).scoped_to(:city) }
    it { should validate_presence_of(:name) }
  end
end
