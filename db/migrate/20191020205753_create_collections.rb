class CreateCollections < ActiveRecord::Migration[5.2]
  def change
    create_table :collections do |t|
      t.integer :crt, null: false
      t.integer :mod, null: false
      t.integer :scm, null: false
      t.integer :ver, null: false
      t.integer :dty, null: false
      t.integer :usn, null: false
      t.integer :ls, null: false
      t.text :conf, null: false
      t.text :models, null: false
      t.text :decks, null: false
      t.text :dconf, null: false
      t.text :tags, null: false

      t.timestamps
    end
  end
end
