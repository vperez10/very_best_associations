class Neighborhood < ActiveRecord::Base
  validates :name, :uniqueness => { :scope => :city }
  validates :name, :city, presence: true
  has_many :venues
end
