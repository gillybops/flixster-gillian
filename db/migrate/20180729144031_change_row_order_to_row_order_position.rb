class ChangeRowOrderToRowOrderPosition < ActiveRecord::Migration[5.1]
  def change
    rename_column :sections, :row_order, :row_order_position
  end
end
