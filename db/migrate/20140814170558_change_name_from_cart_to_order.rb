class ChangeNameFromCartToOrder < ActiveRecord::Migration
  def change
    rename_column :orders, :get_order, :delivery
    change_column :orders, :delivery, :string
  end
end
