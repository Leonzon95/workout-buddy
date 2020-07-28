class CreateExerciseWorkouts < ActiveRecord::Migration[6.0]
  def change
    create_table :exercise_workouts do |t|
      t.references :exercise, null: false, foreign_key: true
      t.references :workout, null: false, foreign_key: true

      t.timestamps
    end
  end
end
