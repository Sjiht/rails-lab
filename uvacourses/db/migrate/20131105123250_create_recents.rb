class CreateRecents < ActiveRecord::Migration
  def change
    create_table :recents do |t|
      t.integer :vakID
      t.string :cookieID
      t.string :timestamp
    end
  end
end
