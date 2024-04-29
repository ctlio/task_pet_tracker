desc "Fill the database tables with some sample data"
task({ :sample_data => :environment }) do
  p "creating sample data"

  if Rails.env.development?
    Pet.delete_all
    Task.delete_all
    User.delete_all
  end

  username = "Ken"

  User.create(
    email: "#{username}@example.com",
    password: "password",
    username: username.downcase,
    avatar_image: "https://robohash.org/toe",
    private: [true, false].sample,
  )

  
end
