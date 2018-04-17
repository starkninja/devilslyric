class CreateShouts < ActiveRecord::Migration
  def change
    create_table :shouts do |t|
      t.integer :user_id
      t.integer :author_id
      t.text :content

      t.timestamps null: false
    end
  end
end
