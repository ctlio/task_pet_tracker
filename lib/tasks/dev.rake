desc "Fill the database tables with some sample data"
unless Rails.env.production?
  namespace :dev do
    desc "Drops, creates, migrates, and adds sample data to database"
    task reset: [
      :environment,
      "db:drop",
      "db:create",
      "db:migrate",
      "dev:sample_data"
    ]

    desc "Adds sample data for development environment"
    task sample_data: [
      :environment,
      "dev:add_users",
      "dev:add_tasks",
      "dev:add_pets"
    ] do
      puts "done adding sample data"
    end

    task add_users: :environment do
      puts "adding users..."
      names = ["brian", "calvin", "jerry"]

      names.each do |name|
        u = User.create(
          email: "#{name}@example.com",
          username: name,
          password: "password",
          avatar_image: "https://robohash.org/#{name}"
        )
        puts "added #{u.email}"
      end

      puts "done"
    end

    task add_tasks: :environment do
      puts "adding tasks"
      10.times do |i|
        t = Task.create(
          task_owner_id: User.all.sample.id,
          description: Faker::Hobby.activity,
          status: Task.statuses.keys.sample,
          due_date: Faker::Date.between(from: '2024-04-15', to: '2024-04-26')
  
        )
      end
      puts "done"
    end

    task add_pets: :environment do
      puts "adding pets"
        3.times do |i|
          p = Pet.create(
            pet_owner_id: User.all.sample.id,
            name: Faker::Movies::HarryPotter.character,
            status: Pet.statuses.keys.sample,
            happiness: random_number = rand(1..100)
            )
        end
      puts "done"
    end
 
  end
end
