class CreateTrack < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :name, null: false
      t.integer :album_id, null: false
      t.string :regularity, null: false
    end

    add_index :tracks, :album_id, :unique => true
  end
end
