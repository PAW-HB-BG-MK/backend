class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name
      t.integer :timestamp
      t.references :card, null: false, foreign_key: true

      t.timestamps
    end
  end
end
