class CreateTrackers < ActiveRecord::Migration
  def change
    create_table :trackers do |t|
      t.string :title
      t.string :kind
      t.references :pool, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
