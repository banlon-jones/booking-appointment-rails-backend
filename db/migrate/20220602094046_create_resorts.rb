class CreateResorts < ActiveRecord::Migration[7.0]
  def change
    create_table :resorts do |t|
      t.string :name, null: false
      t.string :city, null: false
      t.string :country, null: false
      t.string :image, null: false
      t.string :description, null: false
      t.decimal :cost, null: false

      t.timestamps
    end
  end
end
