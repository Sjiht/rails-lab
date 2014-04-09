class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :facebookID
      t.string :firstName
      t.string :lastName
      t.text :profilePicture

      t.timestamps
    end
  end
end
