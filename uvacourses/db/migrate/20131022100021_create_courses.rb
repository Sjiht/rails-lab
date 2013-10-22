class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.integer :vakID
      t.string :vaknaam
      t.string :instituut
      t.string :periode
      t.string :beschrijving
      t.string :leerdoelen
      t.string :examinatie
      t.integer :ects
      t.timestamps
    end
  end
end