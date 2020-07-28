class CreateExercises < ActiveRecord::Migration[6.0]
  def change
    create_table :exercises do |t|
      t.string :name
      t.string :reps
      t.string :sets
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
