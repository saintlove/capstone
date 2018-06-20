class CreateProblems < ActiveRecord::Migration[5.1]
  def change
    create_table :problems do |t|
      t.text :prompt
      t.text :solution_tests

      t.timestamps
    end
  end
end
