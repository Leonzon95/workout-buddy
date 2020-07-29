class CreateCategoryWorkout < ActiveRecord::Migration[6.0]
  def change
    create_table :category_workouts do |t|
      t.references :category, null: false, foreign_key: true
      t.references :workout, null: false, foreign_key: true
    end
  end
end
