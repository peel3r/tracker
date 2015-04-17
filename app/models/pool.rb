class Pool < ActiveRecord::Base

  #Validations
  validates_presence_of :title

  #Relationships
  has_many :trackers,:dependent => :destroy
  has_many :submissions,:dependent => :destroy

  def serialize_for_graph
    #delegation technique - execution done thorough another class
    PoolSerializer.count_per_month(self).to_json
  end
end
