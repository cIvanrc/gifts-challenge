class CreateRecipients < ActiveRecord::Migration[6.1]
  def change
    create_table :recipients do |t|
      t.references :school, null: false, foreign_key: true
      t.string :name, null: false
      t.string :address, null: false

      t.timestamps
    end
  end
end
