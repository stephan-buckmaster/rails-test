class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :customer
      t.timestamps
    end
    create_join_table :orders, :books
  end
end
