class AddDeadlineToCards < ActiveRecord::Migration[6.0]
  def change
    add_column :cards, :deadline, :integer
  end
end
