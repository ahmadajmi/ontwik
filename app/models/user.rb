class User < ActiveRecord::Base

  has_many :videos

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
        user.nickname       = auth["info"]["nickname"]
        user.name           = auth['info']['name'] || ""
        user.location       = auth["info"]["location"]
        user.description    = auth["info"]["description"]
        user.image          = auth["info"]["image"]

        user.website_url    = auth["info"]["urls"]["Website"]
        user.twitter_url    = auth["info"]["urls"]["Twitter"]
        user.profile_background_image_url = auth["extra"]["raw_info"]["profile_background_image_url"]
        user.profile_background_image_url_https = auth["extra"]["raw_info"]["profile_background_image_url_https"]
      end
    end
  end

end
