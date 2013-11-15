class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :vaknaam
      t.string :periode
      t.string :beschrijving
      t.string :leerdoelen
      t.string :examinatie
      t.integer :ects
      t.string :faculteitID
      t.timestamps
    end
  end
end