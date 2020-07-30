class RemoveUserIdFromExercises < ActiveRecord::Migration[6.0]
  def change
    remove_column :exercises, :user_id
  end
end
