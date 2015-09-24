class Page < ActiveRecord::Base
  acts_as_paranoid
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates_presence_of :title
end
