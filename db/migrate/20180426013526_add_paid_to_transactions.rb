class AddPaidToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :paid, :boolean, :default => false
  end
end
