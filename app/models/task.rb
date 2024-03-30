# == Schema Information
#
# Table name: tasks
#
#  id            :bigint           not null, primary key
#  description   :text             not null
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
end
