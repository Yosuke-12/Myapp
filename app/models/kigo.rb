class Kigo < ApplicationRecord
  belongs_to :user
  validates :headword, presence: true, uniqueness: true
  validates :season, presence: true
  validates :meaning, presence: true
  validates :example, presence: true

  scope :search_by_term, ->(term) { where("headword LIKE ?", "%#{sanitize_sql_like(term)}%") }
end
