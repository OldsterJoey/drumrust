class AddPaidToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :paid, :boolean, default: false
  end
end
