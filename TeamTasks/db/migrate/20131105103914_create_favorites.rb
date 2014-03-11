class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.integer :vakID
      t.string :cookieID

      t.timestamps
    end
  end
end
