class Availability < ActiveRecord::Base
  belongs_to :space
  validates_presence_of :start_date, :end_date

  scope :upcoming, ->{ where("end_date >= ?", Date.today) }

  def range
    "#{start_date.strftime('%d %b %Y')} - #{end_date.strftime('%d %b %Y')}"
  end
end
