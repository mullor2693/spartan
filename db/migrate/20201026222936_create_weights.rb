class CreateWeights < ActiveRecord::Migration[6.0]
  def change
    create_table :weights do |t|
      t.decimal :score
      t.datetime :evaluation_date
      t.text :notes
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end

    add_column :users, :desired_weight, :decimal
  end
end
