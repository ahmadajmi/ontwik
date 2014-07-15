require 'acts-as-taggable-on'

class Video < ActiveRecord::Base
  belongs_to :user
  validates :url, presence: true

  acts_as_taggable
  acts_as_likeable

  def self.search(query)
    where("title like ?", "%#{query}%")
  end

end
