class CreateFaculteitens < ActiveRecord::Migration
  def change
    create_table :faculteitens do |t|
      t.string :faculteitnaam
      t.timestamps
    end
  end
end
