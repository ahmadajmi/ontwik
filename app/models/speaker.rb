class Speaker < ActiveRecord::Base
  extend FriendlyId
  friendly_id :nickname

  validates :name, :presence => true, :on => :update

  mount_uploader :profile_banner, ProfileBannerUploader

  has_many :talks

  acts_as_follower
  acts_as_followable
  acts_as_liker

  def self.create_with_omniauth(auth)
    create! do |speaker|
      speaker.provider = auth['provider']
      speaker.uid = auth['uid']
      if auth['info']
        speaker.nickname       = auth["info"]["nickname"]
        speaker.name           = auth['info']['name'] || ""
        speaker.location       = auth["info"]["location"]
        speaker.description    = auth["info"]["description"]
        speaker.image          = auth["info"]["image"]

        speaker.website_url    = auth["info"]["urls"]["Website"]
        speaker.twitter_url    = auth["info"]["urls"]["Twitter"]
        speaker.profile_background_image_url = auth["extra"]["raw_info"]["profile_background_image_url"]
        speaker.profile_background_image_url_https = auth["extra"]["raw_info"]["profile_background_image_url_https"]
      end
    end
  end

end
