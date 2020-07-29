class CreateWorkouts < ActiveRecord::Migration[6.0]
  def change
    create_table :workouts do |t|
      t.string :name
      t.boolean :is_private, default: true
      
      t.timestamps
    end
  end
end
