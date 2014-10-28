class Topic < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name

  has_many :talks

  validates :name, :uniqueness => { :message => "is already used before." }, :on => :create
end
