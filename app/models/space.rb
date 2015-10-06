class Space < ActiveRecord::Base
  paginates_per 5
  belongs_to :user
  validates_presence_of :name, :country

  def country_name
    country = ISO3166::Country[self.country]
    country.translations[I18n.locale.to_s] || country.name
  end
end
