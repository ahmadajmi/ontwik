class AddProfileBannerToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :profile_banner, :string
  end
end
