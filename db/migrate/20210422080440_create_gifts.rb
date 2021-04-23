class CreateGifts < ActiveRecord::Migration[6.1]
  def change
    create_table :gifts do |t|
      t.integer :order_id
      t.string :type
      t.string :description

      t.timestamps
    end
    add_index :gifts, [:type, :order_id]
  end
end
