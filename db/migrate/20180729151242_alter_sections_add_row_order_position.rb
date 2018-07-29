ls g migration alter_sections_add_row_order_positionalass AlterSectionsAddRowOrderPosition < ActiveRecord::Migration[5.1]
  def change
    add_column :sections, :row_order_position, :integer
    add_index :sections, :row_order_position
  end
end
