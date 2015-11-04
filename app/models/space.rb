class Space < ActiveRecord::Base
  paginates_per 12
  attr_accessor :location

  belongs_to :user
  has_many :photos, class_name: 'SpacePhoto', dependent: :destroy
  has_many :availabilities, dependent: :destroy
  has_many :requests
  has_and_belongs_to_many :features

  validates_presence_of :name,   :number_of_rooms, :number_of_people_allowed,
  :country, :locality, :administrative_area, :postal_code, :latitude, :longitude

  def host_bio
    user.about.to_s
  end

  def country_name
    country = ISO3166::Country[self.country]
    country.translations[I18n.locale.to_s] || country.name
  end

  def main_photo
    photos.first || photos.build
  end

  def has_photo?
    photos.count > 0
  end

  def available?
    availabilities.upcoming.count > 0
  end

  def self.available_countries
    uniq.pluck :country
  end
end
