class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.integer :inout
      t.integer :amount
      t.string :category
      t.integer :user_id
      t.integer :post_id

      t.timestamps
    end
  end
end
