class AddHappinessToPets < ActiveRecord::Migration[7.0]
  def change
    add_column :pets, :happiness, :integer, default: 50
  end
end
