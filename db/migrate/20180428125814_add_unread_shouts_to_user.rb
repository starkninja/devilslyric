class AddUnreadShoutsToUser < ActiveRecord::Migration
  def change
    add_column :users, :unread_shouts, :integer, :default => 0
  end
end
