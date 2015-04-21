class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.integer   :customer_id
      t.integer   :product_id
      t.datetime  :date
      t.float     :quantity
      t.float     :total_price
      
      t.timestamps
    end
  end
end
