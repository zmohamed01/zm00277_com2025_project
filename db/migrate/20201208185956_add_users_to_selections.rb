class AddUsersToSelections < ActiveRecord::Migration[5.2]
  def change
    add_index :selections, :user_id
  end
end
