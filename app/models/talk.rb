require 'acts-as-taggable-on'

class Talk < ActiveRecord::Base
  belongs_to :profile
  belongs_to :topic

  include PublicActivity::Common

  is_impressionable counter_cache: true, column_name: :view_count, unique: :all

  paginates_per 25

  validates :url, :uniqueness => { :message => "is already used before." }, :on => :create
  validates :url, :tag_list, :presence => true, :on => :create
  validates :title, :tag_list, :presence => true, :on => :update

  acts_as_taggable
  acts_as_likeable

  def self.search(query)
    where("title like ?", "%#{query}%")
  end

end
