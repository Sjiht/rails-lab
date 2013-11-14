class CreateSaveds < ActiveRecord::Migration
  def change
    create_table :saveds do |t|
      t.string :vakID
      t.string :cookieID
      t.timestamps
    end
  end
end
