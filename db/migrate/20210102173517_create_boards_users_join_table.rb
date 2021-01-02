class CreateBoardsUsersJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :boards, :users do |t|
      t.index :board_id
      t.index :user_id
    end
  end
end
