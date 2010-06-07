class Pirate < ActiveRecord::Base
  set_inheritance_column :not_used
  
  has_many :ships
  
  scope :evil, where(:type => 'evil')
  scope :very_evil, where(:type => 'very_evil')
end