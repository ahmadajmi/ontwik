class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :nickname
      t.string :name
      t.string :location
      t.string :image
      t.string :description

      t.string :website_url
      t.string :twitter_url
      t.string :profile_background_image_url
      t.string :profile_background_image_url_https
      t.string :provider
      t.string :uid

      t.timestamps
    end
  end
end
