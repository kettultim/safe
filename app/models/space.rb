class Space < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :name, :country
end
