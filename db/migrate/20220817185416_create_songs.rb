class CreateSongs < ActiveRecord::Migration[6.1]
  def change
    create_table :songs do |t|
      t.string :title
      t.integer :played_count
      t.references :album, null: false, foreign_key: true

      t.timestamps
    end
  end
end
