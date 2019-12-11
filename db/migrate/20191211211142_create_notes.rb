class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.text :guid
      t.integer :mid
      t.integer :mod
      t.integer :usn
      t.text :tags
      t.text :flds
      t.integer :sfld
      t.integer :csum
      t.integer :flags
      t.text :data

      t.timestamps
    end
  end
end
