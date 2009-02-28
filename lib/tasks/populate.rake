
namespace :populate do
  desc "geocode yahoo locations"
  task(:geocode => :environment) do
    
    locs = open("#{RAILS_ROOT}/public/location.yml") { |f| YAML.load(f) }
    
    locs.each_key do |k|
      puts "#{k},#{locs[k]}"
      geo =  Geokit::Geocoders::GoogleGeocoder.geocode(k+', italy')
      MeteoLocation.create!(:street_address => geo.street_address, 
                            :lat => geo.lat,
                            :lng => geo.lng,
                            :full_address => geo.full_address,
                            :zip => geo.zip,
                            :precision => geo.precision,
                            :state => geo.state,
                            :success => geo.success,
                            :city => geo.city,
                            :country_code => geo.country_code,     
                            :location_id => locs[k]) if geo.success
    end
    
    

  end
end