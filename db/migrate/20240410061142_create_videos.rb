class CreateVideos < ActiveRecord::Migration[7.0]
  def change
    create_table :videos do |t|
      t.references :user, null: false, foreign_key: true

      t.string :link, null: false
      t.string :uid
      t.string :author
      t.string :title
      t.datetime :published_at
      t.integer :likes
      t.integer :dislikes

      t.timestamps
    end
  end
end
