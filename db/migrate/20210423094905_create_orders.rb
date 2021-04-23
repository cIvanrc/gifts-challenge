class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :school
      t.string :status, null: false, default: 'processing'
      t.boolean :is_availale, null: false, default: true

      t.timestamps
    end
  end
end
