class Ship < ActiveRecord::Base
  belongs_to :pirate
  has_many   :sailors

  named_scope :heavy_loaded, :conditions => 'no_of_cannons > 16'
  named_scope :weak, :conditions => ['no_of_cannons <= 16']
end