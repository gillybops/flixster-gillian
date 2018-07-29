class AddRowOrderPositionToSections < ActiveRecord::Migration[5.1]
  def change
    add_column :sections, :row_order_position, :integer
    add_index :sections, :row_order_position
  end
end
