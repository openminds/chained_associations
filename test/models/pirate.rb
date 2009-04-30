class Pirate < ActiveRecord::Base
  has_many :ships
  
  named_scope :evil, :conditions => {:type => 'evil'}
  named_scope :very_evil, :conditions => {:type => 'very_evil'}
end