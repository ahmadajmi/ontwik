class Comment < ActiveRecord::Base
  belongs_to :talk
  belongs_to :profile
  # attr_accessible :content, :talk_id
end
