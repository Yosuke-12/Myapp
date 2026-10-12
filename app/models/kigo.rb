class Kigo < ApplicationRecord
  belongs_to :user
  validates :headword, presence: true, uniqueness: true
  validates :season, presence: true
  validates :meaning, presence: true
  validates :example, presence: true

  SEARCHABLE_COLUMNS = %w[headword season].freeze
  scope :search_by_term, ->(term, column = "headword") {
    # ホワイトリストでカラム名を検証(SQLインジェクション対策として必須)
    safe_column = column.to_s.in?(SEARCHABLE_COLUMNS) ? column : "headword"
    where("#{safe_column} LIKE ?", "%#{sanitize_sql_like(term)}%")
  }
end
