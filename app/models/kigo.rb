class Kigo < ApplicationRecord
  belongs_to :user
  validates :headword, uniqueness: true

  scope :search_by_term, ->(term) { where("headword LIKE ?", "%#{sanitize_sql_like(term)}%") }
end
