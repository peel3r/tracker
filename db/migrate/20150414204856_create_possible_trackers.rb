class CreatePossibleTrackers < ActiveRecord::Migration
  def change
    create_table :possible_trackers do |t|
      t.references :tracker
      t.string :title

      t.timestamps null: false
    end
  end
end
