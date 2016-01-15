class UserSeeder
  USERS = [
    {
      first_name: "Carl",
      last_name: "Veneza",
      email: "cv@gmail.com",
      role: "member",
      password: "password",
      password_confirmation: "password",
      profile_photo: "http://lh3.ggpht.com/-TWC9qIZtt_c/Td-Z61cQk3I/AAAAAAAAAwY/HnIRI9DkBJg/s1600-h/facebook-dp%25255B7%25255D.png"
    }, {
      first_name: "Tali",
      last_name: "Koss",
      email: "tk@gmail.com",
      role: "member",
      password: "password",
      password_confirmation: "password",
      profile_photo: "http://lh3.ggpht.com/-TWC9qIZtt_c/Td-Z61cQk3I/AAAAAAAAAwY/HnIRI9DkBJg/s1600-h/facebook-dp%25255B7%25255D.png"
    }, {
      first_name: "Lawrence",
      last_name: "Kati",
      email: "lk@gmail.com",
      role: "member",
      password: "password",
      password_confirmation: "password",
      profile_photo: "http://lh3.ggpht.com/-TWC9qIZtt_c/Td-Z61cQk3I/AAAAAAAAAwY/HnIRI9DkBJg/s1600-h/facebook-dp%25255B7%25255D.png"
    }, {
      first_name: "Jie",
      last_name: "Xu",
      email: "jx@gmail.com",
      role: "member",
      password: "password",
      password_confirmation: "password",
      profile_photo: "http://lh3.ggpht.com/-TWC9qIZtt_c/Td-Z61cQk3I/AAAAAAAAAwY/HnIRI9DkBJg/s1600-h/facebook-dp%25255B7%25255D.png"
    }
  ]

  def self.seed!
    USERS.each do |user_params|
      first_name = user_params[:first_name]
      user = User.find_or_initialize_by(first_name: first_name)
      user.assign_attributes(user_params)
      user.save!
    end
  end
end
