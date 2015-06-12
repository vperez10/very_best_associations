require 'rails_helper'

describe Favorite do
  describe "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:dish) }
    it { should belong_to(:venue) }
  end

  describe "validations" do
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:dish_id) }
    it { should validate_presence_of(:venue_id) }
  end
end
