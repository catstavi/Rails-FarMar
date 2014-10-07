class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :vendor_id

      t.timestamps
    end
  end
end
