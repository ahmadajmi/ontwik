class User < ActiveRecord::Base

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
         user.name = auth['info']['name'] || ""
         user.nickname = auth["info"]["nickname"]
         user.location = auth["info"]["location"]
         user.description = auth["info"]["description"]
      end
    end
  end

end
