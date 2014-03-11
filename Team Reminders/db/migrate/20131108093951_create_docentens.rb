class CreateDocentens < ActiveRecord::Migration
  def change
    create_table :docentens do |t|
      t.integer :vakID
      t.string :docentNaam
      t.string :docentURL
      t.timestamps
    end
  end
end
