class CreateWorkouts < ActiveRecord::Migration[6.0]
  def change
    create_table :workouts do |t|
      t.string :name
      t.text :description
      t.json :training_days, default: {L: false, M: false, X: false, J: false, V: false, S: false, D: false}
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
