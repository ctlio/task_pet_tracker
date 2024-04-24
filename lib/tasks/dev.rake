desc "Fill the database tables with some sample data"
task({ :sample_data => :environment }) do

  p "creating sample data"

  if Rails.env.development?
    Pet.delete_all
    Task.delete_all
    User.delete_all
  end

end
 
