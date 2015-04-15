class PossibleTracker < ActiveRecord::Base
belongs_to :tracker
serialize :title
end
