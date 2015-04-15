class Pool < ActiveRecord::Base

  #Validations
  validates_presence_of :title

  #Relationships
  has_many :trackers
  has_many :submissions
end
