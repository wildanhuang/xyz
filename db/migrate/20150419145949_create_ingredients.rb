class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.integer :product_id
      t.integer :resource_id
      t.float   :rate_percent

      t.timestamps
    end
  end
end
