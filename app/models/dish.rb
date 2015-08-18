class Dish < ActiveRecord::Base
  validates :name, :cuisine_id, presence: true
  validates :name, :uniqueness => { :scope => :cuisine_id }
end
