class MeteoLocation < ActiveRecord::Base
  require 'yahoo-weather'
  acts_as_mappable

  def self.valid_geocode?(geo)
    geo.success && geo.city!=nil && geo.country_code == 'IT'
  end
 
  def self.geo_locate(location)
    Geokit::Geocoders::MultiGeocoder.geocode(location+', italy')
  end

  class << self; extend ActiveSupport::Memoizable; self; end.memoize :geo_locate
end
