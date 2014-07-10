class Video < ActiveRecord::Base
  belongs_to :user

  validates :url, presence: true
  # validates :user_id, presence: true
end
