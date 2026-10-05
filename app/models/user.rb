class User < ApplicationRecord
  has_secure_password
  has_many :kigos, dependent: :destroy
  validates :student_id, presence: true, uniqueness: true
end
