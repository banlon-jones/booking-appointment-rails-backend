class AddIsDeleteToResorts < ActiveRecord::Migration[7.0]
  def change
    add_column :resorts, :isDeleted, :boolean, default: false
  end
end
