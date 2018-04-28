class AddDefaultAvatarToUsers < ActiveRecord::Migration
  def change
    change_column :users, :avatar_link, :string, :default => "man.png"
  end
end
