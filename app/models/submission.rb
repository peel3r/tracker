class Submission < ActiveRecord::Base
  belongs_to :pool
  has_many :answers, :dependent => :destroy

  accepts_nested_attributes_for :answers
end
