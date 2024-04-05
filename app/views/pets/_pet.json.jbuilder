json.extract! pet, :id, :pet_owner_id, :name, :status, :created_at, :updated_at
json.url pet_url(pet, format: :json)
