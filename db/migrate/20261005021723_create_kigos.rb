class CreateKigos < ActiveRecord::Migration[7.2]
  def change
    create_table :kigos do |t|
      t.references :user, null: false, foreign_key: true
      t.string :headword, null: false
      t.string :season, null: false
      t.text :meaning, null: false
      t.text :example, null: false

      t.timestamps
    end

    add_index :kigos, :headword, unique: true
  end
end
