class ChangeTaskCompleted < ActiveRecord::Migration
  def change
    change_table :tasks do |t|
      t.change :taskCompleted, :boolean
    end
  end
end
