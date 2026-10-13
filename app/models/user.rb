class User < ApplicationRecord
  has_many :kigos, dependent: :destroy
  validates :name, presence: true
  validates :student_id, presence: true, uniqueness: true
  validates :password, length: { minimum: 5 }, allow_nil: true
  has_secure_password
end
