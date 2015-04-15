class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :submission, index: true, foreign_key: true
      t.references :possible_tracker, index: true, foreign_key: true
      t.string :value

      t.timestamps null: false
    end
  end
end
