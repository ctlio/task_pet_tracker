# == Schema Information
#
# Table name: pets
#
#  id           :bigint           not null, primary key
#  happiness    :integer          default(50)
#  name         :string           not null
#  status       :string           default("pending")
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  pet_owner_id :bigint           not null
#
# Indexes
#
#  index_pets_on_pet_owner_id  (pet_owner_id)
#
# Foreign Keys
#
#  fk_rails_...  (pet_owner_id => users.id)
#
class Pet < ApplicationRecord
  belongs_to :pet_owner, class_name: "User"

  attribute :happiness, :integer, default: 50

  def status
    if happiness >= 70
      "happy"
    elsif happiness >= 40
      "neutral"
    else
      "sad"
    end
  end

  validates :name, presence: true
end
