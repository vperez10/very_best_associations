class Venue < ActiveRecord::Base
  validates :name, :uniqueness => { :scope => :address }
  validates :name, :address, :neighborhood_id, presence: true
  has_many :cuisines
  has_many :favorites
  belongs_to :neighborhood
end
