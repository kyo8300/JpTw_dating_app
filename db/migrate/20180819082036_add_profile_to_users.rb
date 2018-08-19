class AddProfileToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :username, :string
    add_column :users, :sex, :integer, default: 0, null: false
    add_column :users, :birth, :date
    add_column :users, :age, :integer
    add_column :users, :nationality, :integer, default: 0, null: false
    add_column :users, :height, :integer
    add_column :users, :occupation, :integer, default: 0, null: false
    add_column :users, :singleword, :text
  end
end
