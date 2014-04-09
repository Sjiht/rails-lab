class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :taskName
      t.integer :directoryID
      t.integer :taskDate
      t.text :taskContent
      t.integer :taskCompleted

      t.timestamps
    end
  end
end
