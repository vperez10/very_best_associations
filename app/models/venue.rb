class Venue < ActiveRecord::Base
  validates :name, :uniqueness => { :scope => :address }
  validates :name, :address, :neighborhood_id, presence: true
end
