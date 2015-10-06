class Space < ActiveRecord::Base
  paginates_per 5
  belongs_to :user
  validates_presence_of :name, :country
  has_many :photos, class_name: 'SpacePhoto', dependent: :destroy

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
end
