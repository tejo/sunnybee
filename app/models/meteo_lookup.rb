class MeteoLookup 
  require 'yahoo-weather'
  
  def self.meteoize(location)
    meteo = self.meteo_info_for(location)
    if(meteo)
      unmemoize_all() if meteo.condition.date < 1.hour.ago
    end
    meteo
  end

  def self.meteo_info_for(location)
    geo = MeteoLocation.geo_locate(location)
    if MeteoLocation.valid_geocode?(geo)
      meteo_station = MeteoLocation.find_closest(:origin => geo)
      res = self.meteo_lookup(meteo_station.location_id)
      #log infos 
      RAILS_DEFAULT_LOGGER.info geo.city.to_s + ' ' + geo.country_code.to_s
      RAILS_DEFAULT_LOGGER.info meteo_station.location_id + ' ' + meteo_station.city
      RAILS_DEFAULT_LOGGER.info geo.inspect
      RAILS_DEFAULT_LOGGER.info res.inspect
    else
      res = nil
    end
    res
  end
  
  def self.meteo_lookup(location_id)
    client = YahooWeather::Client.new
    begin
      client.lookup_location(location_id,'c')
    rescue
      nil
    end
  end

  class << self; extend ActiveSupport::Memoizable; self; end.memoize :meteo_info_for
end
