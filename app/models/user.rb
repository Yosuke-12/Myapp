class User < ApplicationRecord
  has_many :kigos, dependent: :destroy
  validates :name, presence: true
  validates :student_id, presence: true, uniqueness: true
  has_secure_password
end
