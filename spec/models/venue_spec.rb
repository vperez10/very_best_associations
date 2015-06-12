require 'rails_helper'

describe Venue do
  describe "associations" do
    it { should belong_to(:neighborhood) }
    it { should have_many(:favorites) }
  end

  describe "validations" do
    it { should validate_uniqueness_of(:name).scoped_to(:address) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:neighborhood_id) }
  end
end
