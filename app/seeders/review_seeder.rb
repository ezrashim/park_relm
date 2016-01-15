class ReviewSeeder
  REVIEWS = [
    {
      title: "Not too great",
      body: "Just another boring place to walk at! I wish they had soccer field!",
      user_id: 8,
      park_id: 1,
      rating: 3,
      vote_count: 1256
    }, {
      title: "Awesome place to rood a book",
      body: "This place has so many hideaways to enjoy Harry Potter novel series! The beanches are very comfy!",
      user_id: 7,
      park_id: 1,
      rating: 9,
      vote_count: 4567
    }, {
      title: "Heaven for bike riders",
      body: "The place has many off road trails to push your mountain bike to its limits. The trails have water fountains every 4 miles for you to hydrate!",
      user_id: 8,
      park_id: 1,
      rating: 3,
      vote_count: 5673
    }, {
      title: "Worst park ever",
      body: "Lawns are never green and trees almost never are tall enough to create a nice shade",
      user_id: 8,
      park_id: 1,
      rating: 1,
      vote_count: 123456
    }, {
      title: "Worst park ever",
      body: "Lawns are never green and trees almost never are tall enough to create a nice shade",
      user_id: 8,
      park_id: 1,
      rating: 1,
      vote_count: 123456
    }, {
      title: "Romantic place",
      body: "I like to bring my girlfriend to this park after sunset because there are many lights that magically eluminates tree leaves!",
      user_id: 1,
      park_id: 1,
      rating: 3,
      vote_count: 56
    }, {
      title: "Great place for children",
      body: "It is a great place for playdates for my children!",
      user_id: 8,
      park_id: 1,
      rating: 1,
      vote_count: 1256
    }, {
      title: "Best tanning in town",
      body: "This place is super friendly for afternoon tanning. Offers beach chairs",
      user_id: 8,
      park_id: 1,
      rating: 10,
      vote_count: 125
    }, {
      title: "Horrible place to have birthdays",
      body: "Offers no shade and generally not secure area!",
      user_id: 1,
      park_id: 1,
      rating: 3,
      vote_count: 76
    }, {
      title: "Untimate Quidditch hosting place",
      body: "Hilly area of the park screams for awesome Quidditch match!",
      user_id: 8,
      park_id: 1,
      rating: 9,
      vote_count: 12567
    }, {
      title: "Best tanning in town 2",
      body: "This place is super friendly for afternoon tanning. Offers beach chairs 4",
      user_id: 8,
      park_id: 1,
      rating: 10,
      vote_count: 156
    }, {
      title: "Untimate Quidditch hosting place",
      body: "Hilly area of the park screams for awesome Quidditch match!",
      user_id: 8,
      park_id: 1,
      rating: 9,
      vote_count: 12567
    }, {
      title: "Best tanning in town 2",
      body: "This place is super friendly for afternoon tanning. Offers beach chairs 4",
      user_id: 8,
      park_id: 1,
      rating: 10,
      vote_count: 156
    }
  ]

  def self.seed!
    REVIEWS.each do |review_params|
      title = review_params[:title]
      review = Review.find_or_initialize_by(title: title)
      review.assign_attributes(review_params)
      review.save!
    end
  end

#   users.each do |user_params|
#     first_name = user_params[:first_name]
#     user = User.find_or_create_by!(first_name: first_name, last_name: last_name, email: email, role: role, password: password, password_confirmation: password_confirmation, profile_photo: profile_photo)
#     user.save!
#   end
end

# This guy did not mention about the cool perks that you may find around the park - restraunts, bars and parking lot avalibility. Looks like that waw his first time in this park!
