json.extract! task, :id, :task_owner_id, :description, :status, :created_at, :updated_at
json.url task_url(task, format: :json)
