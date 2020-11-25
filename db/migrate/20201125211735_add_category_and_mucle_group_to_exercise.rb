class AddCategoryAndMucleGroupToExercise < ActiveRecord::Migration[6.0]
  def change
    change_table :exercises do |t|
      t.string :categories, array: true, default: []
      t.string :muscle_groups, array: true, default: []
    end
  end
end
