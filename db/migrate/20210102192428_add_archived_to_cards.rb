class AddArchivedToCards < ActiveRecord::Migration[6.0]
  def change
    add_column :cards, :archived, :boolean
  end
end
