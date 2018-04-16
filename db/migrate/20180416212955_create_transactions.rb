class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :user_id_to
      t.integer :user_id_from
      t.integer :amount

      t.timestamps null: false
    end
  end
end
