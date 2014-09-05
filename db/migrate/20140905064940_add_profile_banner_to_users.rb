class AddProfileBannerToUsers < ActiveRecord::Migration
  def change
    add_column :users, :profile_banner, :string
  end
end
