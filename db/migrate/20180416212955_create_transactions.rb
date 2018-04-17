class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :user_id
      t.integer :recipient_id
      t.integer :amount

      t.timestamps null: false
    end
  end
end
