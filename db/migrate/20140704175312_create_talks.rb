class CreateTalks < ActiveRecord::Migration
  def change
    create_table :talks do |t|
      t.string :url
      t.string :url_type
      t.string :version
      t.string :provider_url
      t.string :provider_name

      t.text :title
      t.text :html
      t.text :description

      t.string :author_name
      t.string :author_url

      t.string :width
      t.string :height

      t.string :thumbnail_url
      t.string :thumbnail_width
      t.string :thumbnail_height

      t.integer :user_id

      t.timestamps
    end

    add_index :talks, [:user_id, :created_at]

  end
end
