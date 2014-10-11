class AddProfileBannerToSpeakers < ActiveRecord::Migration
  def change
    add_column :speakers, :profile_banner, :string
  end
end
