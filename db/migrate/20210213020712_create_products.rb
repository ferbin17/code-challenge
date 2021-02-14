class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :discription
      t.float :price
      t.float :rating, default: 0
      t.integer :company_id
      t.timestamps
    end
  end
end
