class AddArchivedToLists < ActiveRecord::Migration[6.0]
  def change
    add_column :lists, :archived, :boolean
  end
end
