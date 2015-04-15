class Pool < ActiveRecord::Base
  validates_presence_of :title
  has_many :trackers
  has_many :submissions
end
