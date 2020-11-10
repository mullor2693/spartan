class CreateDietMeals < ActiveRecord::Migration[6.0]
  def change
    create_table :diet_meals do |t|
      t.belongs_to :diet, null: false, foreign_key: true
      t.belongs_to :meal, null: false, foreign_key: true
      t.timestamps
    end
    remove_reference :meals, :diet, index: true, foreign_key: true
  end
end
