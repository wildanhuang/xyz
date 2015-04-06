class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :first_name
      t.string  :last_name
      t.text    :address
      t.string  :phone_number
      t.integer :role_id

      t.timestamps
    end
  end
end
