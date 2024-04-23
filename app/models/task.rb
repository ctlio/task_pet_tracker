# == Schema Information
#
# Table name: tasks
#
#  id                   :bigint           not null, primary key
#  description          :text             not null
#  due_date             :datetime
#  has_happiness_effect :boolean
#  status               :string           default("pending")
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  task_owner_id        :bigint           not null
#
# Indexes
#
#  index_tasks_on_task_owner_id  (task_owner_id)
#
# Foreign Keys
#
#  fk_rails_...  (task_owner_id => users.id)
#
class Task < ApplicationRecord
  belongs_to :task_owner, class_name: "User"
  attribute :due_date, :datetime
  enum status: { pending: "pending", completed: "completed", failed: "failed" }
  after_update :update_pet_happiness, if: :status_changed?

  def self.update_overdue_tasks_status
    where(status: "pending").where("due_date <= ?", Time.now).update_all(status: "failed")
  end

  def update_pet_happiness
    if status == "completed" && !has_happiness_effect
      task_owner.own_pets.each do |pet|
        pet.increment!(:happiness, 10)
      end
      update(has_happiness_effect: true)
    elsif status == "failed" && !has_happiness_effect
      task_owner.own_pets.each do |pet|
        pet.decrement!(:happiness, 10)
      end
      update(has_happiness_effect: true)
    end
  end

  validates :description, presence: true
  validates :due_date, presence: true
end
