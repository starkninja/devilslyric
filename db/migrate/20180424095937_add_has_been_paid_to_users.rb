class AddHasBeenPaidToUsers < ActiveRecord::Migration
  def change
    add_column :users, :has_been_paid, :boolean, default: false
  end
end
