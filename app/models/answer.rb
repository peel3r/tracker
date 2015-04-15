class Answer < ActiveRecord::Base
  belongs_to :submission
  belongs_to :possible_tracker
  belongs_to :tracker
end
