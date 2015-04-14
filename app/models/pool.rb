class Pool < ActiveRecord::Base
  validates_presence_of :title
  has_many :trackers
end
