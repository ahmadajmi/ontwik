require 'acts-as-taggable-on'

class Talk < ActiveRecord::Base
  include PublicActivity::Common

  belongs_to :profile
  has_many :comments
  acts_as_taggable
  acts_as_likeable
  paginates_per 25

  validates :url, :tag_list, presence: true, on: :create
  validates :title, :tag_list, presence: true, on: :update
  validates :url, uniqueness: { message: 'is already used before.' }, on: :create
  is_impressionable counter_cache: true, column_name: :view_count, unique: :all

  def self.search(query)
    where("title like ?", "%#{query}%")
  end
end