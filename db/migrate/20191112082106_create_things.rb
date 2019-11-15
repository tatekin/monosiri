class CreateThings < ActiveRecord::Migration[5.2]
  def change
    create_table :things do |t|
      t.string :name
      t.integer :number
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
