class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :url
      t.string :url_type
      t.string :version
      t.string :provider_url
      t.string :provider_name

      t.string :title
      t.string :html
      t.string :description

      t.string :author_name
      t.string :author_url

      t.string :width
      t.string :height

      t.string :thumbnail_url
      t.string :thumbnail_width
      t.string :thumbnail_height
      t.timestamps
    end
  end
end
