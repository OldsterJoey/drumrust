class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.integer :street_number
      t.string :street_name
      t.string :suburb
      t.string :state
      t.string :postcode

      t.timestamps
    end
  end
end
