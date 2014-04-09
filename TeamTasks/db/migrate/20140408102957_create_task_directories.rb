class CreateTaskDirectories < ActiveRecord::Migration
  def change
    create_table :task_directories do |t|
      t.integer :facebookID
      t.string :directoryName

      t.timestamps
    end
  end
end
