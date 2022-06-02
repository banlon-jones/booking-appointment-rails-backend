class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.datetime :date_from
      t.datetime :date_to
      t.references :user, null: false, foreign_key: true
      t.references :resort, null: false, foreign_key: true

      t.timestamps
    end
  end
end
