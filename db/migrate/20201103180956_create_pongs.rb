class CreatePongs < ActiveRecord::Migration[6.0]
  def change
    create_table :pongs do |t|
      t.string :pong

      t.timestamps
    end
  end
end
