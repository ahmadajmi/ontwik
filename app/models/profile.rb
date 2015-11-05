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
        profile.nickname       = auth['info']['nickname']
        profile.name           = auth['info']['name'] || ''
        profile.location       = auth['info']['location']
        profile.description    = auth['info']['description']
        profile.image          = auth['info']['image']

        profile.website_url    = auth['info']['urls']['Website']
        profile.twitter_url    = auth['info']['urls']['Twitter']
        profile.profile_background_image_url = auth['extra']['raw_info']['profile_background_image_url']
        profile.profile_background_image_url_https = auth['extra']['raw_info']['profile_background_image_url_https']
      end
    end
  end

end