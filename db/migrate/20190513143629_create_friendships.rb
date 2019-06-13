class CreateFriendships < ActiveRecord::Migration[5.2]
  def change
    create_table :friendships do |t|
     t.references :user, foreign_key: true
     t.references :friend

      t.timestamps
    end
    #zina
    add_index :friendships, [:user_id, :friend_id], unique: true
  end
end
