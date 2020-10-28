class CreateMeals < ActiveRecord::Migration[6.0]
  def change
    create_table :meals do |t|
      t.string :name
      t.belongs_to :diet, null: false, foreign_key: true
      t.integer :daytime

      t.timestamps
    end
  end
end
