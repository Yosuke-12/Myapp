class Kigo < ApplicationRecord
  belongs_to :user
  validates :headword, presence: true, uniqueness: true
  validates :season, presence: true
  validates :meaning, presence: true
  validates :example, presence: true

  SEARCHABLE_COLUMNS = %w[headword season].freeze
  scope :search_by_term, ->(term, column = "headword") {
    # ホワイトリストでカラム名を検証
    safe_column = SEARCHABLE_COLUMNS.include?(column.to_s) ? column.to_s : "headword"
    where(arel_table[safe_column].matches("%#{sanitize_sql_like(term)}%", "\\"))
  }
end
