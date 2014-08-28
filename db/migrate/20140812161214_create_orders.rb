class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :devlivery

      t.timestamps
    end
  end
end
