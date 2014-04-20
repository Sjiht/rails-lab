class ChangeFacebookId < ActiveRecord::Migration
  def self.up
    rename_column :task_directories, :facebookID, :userID
  end
end
