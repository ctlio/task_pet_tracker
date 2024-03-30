class CreatePets < ActiveRecord::Migration[7.0]
  def change
    create_table :pets do |t|
      t.references :pet_owner, null: false, foreign_key: { to_table: :users }
      t.string :name, null: false
      t.string :status, default: "pending"

      t.timestamps
    end
  end
end
