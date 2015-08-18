class Dish < ActiveRecord::Base
  validates :name, :cuisine_id, presence: true
  validates :name, :uniqueness => { :scope => :cuisine_id }
  has_many :favorites
  belongs_to :cuisine
end
