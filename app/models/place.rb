class Place < ActiveRecord::Base
  validates :name, :latitude, :longitude, presence: true
  validates :name, uniqueness: true

  def as_json(options={})
    {
      name: self.name,
      latitude: self.latitude,
      longitude: self.longitude
    }
  end
end
