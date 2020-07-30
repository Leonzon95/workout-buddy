class DropExerciseWorkouts < ActiveRecord::Migration[6.0]
  def change
    drop_table :exercise_workouts
  end
end
