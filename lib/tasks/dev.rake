desc "Fill the database tables with some sample data"
task({ :sample_data => :environment }) do

  p "creating sample data"

  if Rails.env.development?
    Pet.delete_all
    Task.delete_all
    User.delete_all
  end

  12.times do
    name = Faker::Name.first_name
    User.create(
      email: "#{name}@example.com",
      password: "password",
      username: name,
      avatar_image: "https://robohash.org/#{name}"
    )
  end
  p "There are now #{User.count} users."

  users = User.all
  

  users.each do |user|
    rand(5).times do
      create_task = user.own_tasks.create(
        description: Faker::Hobby.activity,
        status: Task.statuses.keys.sample,
        due_date: Faker::Date.between(from: '2024-04-15', to: '2024-04-26')
      )

      create_pet = user.own_pets.create(
        name: Faker::Tea.variety,
        status: Pet.statuses.keys.sample,
        happiness: random_number = rand(1..100)
      )
    end
  end
  p "There are now #{Task.count} tasks."
  p "There are now #{Pet.count} pets."

end
