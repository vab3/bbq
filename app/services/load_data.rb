class LoadData
  def initialize filename = 'db/restaurants.js'
    @file = File.read(filename)
  end

  def call 
  
    data = JSON.parse(@file)

    data.each do |r|
      vendor = Vendor.find_or_create_by(name: r['name'],
                             website: r['website'],
                             status: 'approved')

      city = r['address2'].split(',')[0]
      state = r['address2'].split(' ').last(2).first
      zip = r['address2'].split(' ').last
      location = Location.find_or_create_by(vendor: vendor,
                                   address_1: r['address1'])
      location.update(location_type: 'restaurant',
                      latitude: r['latitude'],
                      longitude: r['longitude'],
                      city: city,
                      state: state,
                      postal_code: zip,
                      hours: r['hours'],
                      phone: r['phone'])
    end

  end
end
