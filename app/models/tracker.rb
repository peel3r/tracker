class Tracker < ActiveRecord::Base

  #Relationships
  belongs_to :pool
  has_many :possible_trackers, :dependent => :destroy
  has_many :answers, :dependent => :destroy

  accepts_nested_attributes_for :possible_trackers, reject_if: proc {  |attributes|  attributes['title'].blank?  }

  validates_presence_of  :title, :kind

  def serialize_for_graph
    PoolSerializer.answers_per_tracker(self).to_json
  end
end
