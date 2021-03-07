class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.references :category, null: false, foreign_key: true
      t.text :description
      t.integer :price
      t.integer :condition

      t.timestamps
    end
  end
end
