class Topic < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name

  has_many :talks
end
