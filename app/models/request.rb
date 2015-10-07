class Request < ActiveRecord::Base
  belongs_to :user
  belongs_to :space
  validates_presence_of :email, :message
end
