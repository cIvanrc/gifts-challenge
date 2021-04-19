class CreateSchools < ActiveRecord::Migration[6.1]
  def change
    create_table :schools do |t|
      t.string :name, null: false
      t.string :address, null: false

      t.index [:name, :address], unique: true
      t.timestamps
    end
  end
end
