class Favorite < ActiveRecord::Base
  validates :user_id, :dish_id, :venue_id, presence: true
  validates :user_id, :uniqueness => { :scope => [:dish_id, :venue_id], message: ", please note that this item already exists. Please enter a new item." }
  belongs_to :user
  belongs_to :venue
  belongs_to :dish
end
