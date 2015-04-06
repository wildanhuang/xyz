class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string  :name
      t.float   :quantity, default: 0.0

      t.timestamps
    end
  end
end
