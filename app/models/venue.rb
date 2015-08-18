class Venue < ActiveRecord::Base
  validates :name, :uniqueness => { :scope => :address }
end
