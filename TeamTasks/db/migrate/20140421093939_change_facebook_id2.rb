class ChangeFacebookId2 < ActiveRecord::Migration
  def self.up
    rename_column :task_directory_users, :facebookID, :userID
  end
end
