class Page < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates_presence_of :title
end
