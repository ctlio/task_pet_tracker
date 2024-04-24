# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  avatar_image           :string           default("avatar_placeholder.png")
#  email                  :citext           default(""), not null
#  encrypted_password     :string           default(""), not null
#  private                :boolean
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  username               :citext
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_username              (username) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :own_tasks, class_name: "Task", foreign_key: "task_owner_id"
  has_many :own_pets, class_name: "Pet", foreign_key: "pet_owner_id"



 
  validates :username, presence: true, uniqueness: true
end
