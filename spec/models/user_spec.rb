require 'rails_helper'

describe User do
  describe "associations" do
    it { should have_many(:favorites) }
  end

  describe "validations" do
    it { should validate_uniqueness_of(:username) }
    it { should validate_presence_of(:username) }
  end
end
