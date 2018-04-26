class AddDefaultValueToUnreadsInUsers < ActiveRecord::Migration
  def change
    change_column :users, :unread, :integer, :default => 0
  end
end
