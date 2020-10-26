class AddPersonalAttributesToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :surname, :string
    add_column :users, :birth_date, :datetime
    add_column :users, :dni, :string
    add_column :users, :address, :string
    add_column :users, :phone, :integer
  end
end
