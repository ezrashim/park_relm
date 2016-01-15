class AdminSeeder
  ADMINS = [
    {
      first_name: "Ezra",
      last_name: "Shim",
      email: "ezrashim@gmail.com",
      role: "admin",
      password: "password",
      password_confirmation: "password",
      profile_photo: "http://lh3.ggpht.com/-TWC9qIZtt_c/Td-Z61cQk3I/AAAAAAAAAwY/HnIRI9DkBJg/s1600-h/facebook-dp%25255B7%25255D.png"
    }, {
      first_name: "Meder",
      last_name: "Tok",
      email: "mt@gmail.com",
      role: "admin",
      password: "password",
      password_confirmation: "password",
      profile_photo: "http://lh3.ggpht.com/-TWC9qIZtt_c/Td-Z61cQk3I/AAAAAAAAAwY/HnIRI9DkBJg/s1600-h/facebook-dp%25255B7%25255D.png"
    }, {
      first_name: "Leon",
      last_name: "Russo",
      email: "leon@gmail.com",
      role: "admin",
      password: "password",
      password_confirmation: "password",
      profile_photo: "http://lh3.ggpht.com/-TWC9qIZtt_c/Td-Z61cQk3I/AAAAAAAAAwY/HnIRI9DkBJg/s1600-h/facebook-dp%25255B7%25255D.png"
    }, {
      first_name: "Roman",
      last_name: "Levitas",
      email: "roman@gmail.com",
      role: "admin",
      password: "password",
      password_confirmation: "password",
      profile_photo: "http://lh3.ggpht.com/-TWC9qIZtt_c/Td-Z61cQk3I/AAAAAAAAAwY/HnIRI9DkBJg/s1600-h/facebook-dp%25255B7%25255D.png"
    }
  ]

  def self.seed!
    ADMINS.each do |admin_params|
      first_name = admin_params[:first_name]
      admin = User.find_or_initialize_by(first_name: first_name)
      admin.assign_attributes(admin_params)
      admin.save!
    end
  end

#   users.each do |user_params|
#     first_name = user_params[:first_name]
#     user = User.find_or_create_by!(first_name: first_name, last_name: last_name, email: email, role: role, password: password, password_confirmation: password_confirmation, profile_photo: profile_photo)
#     user.save!
#   end
end
