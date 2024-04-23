class AddHasHappinessEffectToTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :has_happiness_effect, :boolean
  end
end
