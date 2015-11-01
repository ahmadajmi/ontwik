class Comment < ActiveRecord::Base
  belongs_to :talk
  belongs_to :profile

  validates :content, presence: true
end