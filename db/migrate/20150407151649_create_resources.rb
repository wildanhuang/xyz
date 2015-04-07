class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string  :name
      t.float   :quantity, default: 0.0

      t.timestamps
    end
  end
end
