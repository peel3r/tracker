class Tracker < ActiveRecord::Base

  #Relationships
  belongs_to :pool
  has_many :possible_trackers
  has_many :answers

  accepts_nested_attributes_for :possible_trackers, reject_if: proc {  |attributes|  attributes['title'].blank?  }

  validates_presence_of :title, :kind
end
