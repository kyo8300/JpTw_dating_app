class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.string :username
      t.integer :sex, default: 0, null: false 
      t.date :birth
      t.integer :age
      t.integer :nationality, default: 0, null: false 
      t.integer :height
      t.integer :occupation, default: 0, null: false 
      t.text :singleword

      t.timestamps
    end
  end
end
