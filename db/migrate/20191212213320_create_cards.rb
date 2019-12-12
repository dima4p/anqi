class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.integer :nid
      t.integer :did
      t.integer :ord
      t.integer :mod
      t.integer :usn
      t.integer :type
      t.integer :queue
      t.integer :due
      t.integer :ivl
      t.integer :factor
      t.integer :reps
      t.integer :lapses
      t.integer :left
      t.integer :odue
      t.integer :odid
      t.integer :flags
      t.text :data

      t.timestamps
    end
  end
end
