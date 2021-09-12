class RestaurantLoader

  def initialize(filename)
    @filename = filename
  end

  def call
    file = File.read(@filename)
    data_hash = JSON.parse(file)

    data_hash.each do |restaurant|
      vendor_details = get_vendor_details(restaurant)
      vendor = Vendor.where(vendor_details).first_or_create!

      location_details = get_location_details(restaurant)
      location_details.merge!(vendor_id: vendor.id)
      location = Location.where(location_details).first_or_create!
    end
  end

  def get_vendor_details(hash)
    {
      name: hash['name'],
      website: hash['website'],
      status: Vendor.statuses[:approved]
    }
  end

  def get_location_details(hash)
    {
      location_type: Location.location_types[:restaurant],
      latitude: hash['latitude'],
      longitude: hash['longitude'],
      address_1: hash['address1'],
      city: hash['address2'].split(' ')[0].split(','),
      state: hash['address2'].split(' ')[1],
      postal_code: hash['address2'].split(' ')[2],
      hours: hash['hours'],
      phone: hash['phone']
    }
  end
end
