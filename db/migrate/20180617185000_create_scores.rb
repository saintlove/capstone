class CreateScores < ActiveRecord::Migration[5.1]
  def change
    create_table :scores do |t|
      t.integer :user_id
      t.integer :problem_id
      t.integer :progress
      t.text :previous_solution

      t.timestamps
    end
  end
end
