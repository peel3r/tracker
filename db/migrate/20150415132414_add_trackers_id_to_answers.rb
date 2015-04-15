class AddTrackersIdToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :tracker_id, :integer
  end
end
