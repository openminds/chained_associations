class Ship < ActiveRecord::Base
  belongs_to :pirate
  has_many   :sailors

  scope :heavy_loaded, where('no_of_cannons > 16')
  scope :weak, where('no_of_cannons <= 16')
end