class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.references :task_owner, null: false, foreign_key: { to_table: :users }
      t.text :description, null: false
      t.string :status, default: "pending"

      t.timestamps
    end
  end
end
