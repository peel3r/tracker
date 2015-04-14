class Tracker < ActiveRecord::Base
  belongs_to :pool
  validates_presence_of :title
end
