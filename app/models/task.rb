# == Schema Information
#
# Table name: tasks
#
#  id            :bigint           not null, primary key
#  description   :text             not null
#  due_date      :datetime
#  status        :string           default("pending")
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  task_owner_id :bigint           not null
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
  validates :description, presence: true
  enum status: {pending: "pending", completed: "completed", failed: "failed" } 

  def self.update_overdue_tasks_status
    where(status: "pending").where("due_date <= ?", Time.now).update_all(status: "failed")
  end

  private

  def update_pet_happiness
    if status == "completed"
      user.pets.each { |pet| pet.update(happiness: pet.happiness + 10) }
    elsif status == "failed"
      user.pets.each { |pet| pet.update(happiness: pet.happiness - 10) }
    end
  end
end

 
