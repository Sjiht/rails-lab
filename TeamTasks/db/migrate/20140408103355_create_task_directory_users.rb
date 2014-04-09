class CreateTaskDirectoryUsers < ActiveRecord::Migration
  def change
    create_table :task_directory_users do |t|
      t.integer :facebookID
      t.integer :directoryID

      t.timestamps
    end
  end
end
