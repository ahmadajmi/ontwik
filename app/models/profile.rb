class Profile < ActiveRecord::Base
  has_many :talks
  has_many :comments

  extend FriendlyId
  friendly_id :nickname

  acts_as_follower
  acts_as_followable
  acts_as_liker

  validates :name, presence: true, on: :update

  validates :profile_banner,
    file_size: {
      maximum: 5.megabytes.to_i
    }

  mount_uploader :profile_banner, ProfileBannerUploader

  def self.create_with_omniauth(auth)
    create! do |profile|
      profile.provider = auth['provider']
      profile.uid = auth['uid']
      if auth['info']
        user.nickname       = auth['info']['nickname']
        user.name           = auth['info']['name'] || ''
        user.location       = auth['info']['location']
        user.description    = auth['info']['description']
        user.image          = auth['info']['image']

        user.website_url    = auth['info']['urls']['Website']
        user.twitter_url    = auth['info']['urls']['Twitter']
        user.user_background_image_url = auth['extra']['raw_info']['profile_background_image_url']
        user.user_background_image_url_https = auth['extra']['raw_info']['profile_background_image_url_https']
      end
    end
  end

end