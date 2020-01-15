class AddNewIndexToVotes < ActiveRecord::Migration[5.2]
  def change
    add_index :votes, [:voter_id, :voter_type, :votable_id, :votable_type], unique: true, name: 'new_votes_index'
  end
end
