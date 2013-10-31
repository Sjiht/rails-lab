class CreateSaveds < ActiveRecord::Migration
  def change
    create_table :saveds do |t|
      t.integer :vakID
      t.string :cookieID

      t.timestamps
    end
  end
end
