class ChangeTaskDate < ActiveRecord::Migration
  def change
    change_table :tasks do |t|
      t.change :taskDate, :date
    end
  end
end
