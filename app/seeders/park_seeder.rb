class ParkSeeder
  PARKS = [
    {
      title: "Commons",
      location: "Boston",
      rating: 9,
      bathroom: true,
      picnic: false,
      pets: true,
      basketball: true,
      user_id: 5
    }, {
      title: "Central Park",
      location: "New York",
      rating: 2,
      bathroom: true,
      picnic: false,
      pets: true,
      basketball: true,
      user_id: 5
    }, {
      title: "Squantum",
      location: "Braintree",
      rating: 6,
      bathroom: true,
      picnic: false,
      pets: false,
      basketball: true,
      user_id: 7
    }, {
      title: "General",
      location: "Portland",
      rating: 5,
      bathroom: true,
      picnic: true,
      pets: true,
      basketball: true,
      user_id: 6
    }, {
      title: "Holy Park",
      location: "Albuquerque",
      rating: 8,
      bathroom: true,
      picnic: true,
      pets: false,
      basketball: true,
      user_id: 2
    }, {
      title: "Blue Hills",
      location: "Milton",
      rating: 4,
      bathroom: false,
      picnic: true,
      pets: false,
      basketball: true,
      user_id: 1
    }, {
      title: "Sunrise",
      location: "Wollaston",
      rating: 8,
      bathroom: false,
      picnic: true,
      pets: false,
      basketball: true,
      user_id: 5
    }, {
      title: "Paradise Valley",
      location: "Sanit Roman",
      rating: 4,
      bathroom: false,
      picnic: true,
      pets: false,
      basketball: true,
      user_id: 1
    }, {
      title: "Green Strap",
      location: "Holiday village",
      rating: 10,
      bathroom: true,
      picnic: true,
      pets: true,
      basketball: true,
      user_id: 5
    }, {
      title: "Cold Creek",
      location: "Davinport",
      rating: 6,
      bathroom: true,
      picnic: true,
      pets: false,
      basketball: true,
      user_id: 3
    }, {
      title: "Bright Sky",
      location: "Wellesley",
      rating: 1,
      bathroom: true,
      picnic: true,
      pets: false,
      basketball: true,
      user_id: 2
    }
  ]

  def self.seed!
    PARKS.each do |park_params|
      title = park_params[:title]
      park = Park.find_or_initialize_by(title: title)
      park.assign_attributes(park_params)
      park.save
    end
  end
end
