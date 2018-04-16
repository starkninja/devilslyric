class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :author_id
      t.integer :transaction_id
      t.text :content

      t.timestamps null: false
    end
  end
end
