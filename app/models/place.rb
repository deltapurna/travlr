class Place < ActiveRecord::Base
  validates :name, :latitude, :longitude, presence: true
  validates :name, uniqueness: true
end
