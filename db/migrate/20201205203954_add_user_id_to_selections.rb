class AddUserIdToSelections < ActiveRecord::Migration[5.2]
  def change
    add_column :selections, :user_id, :int
  end
end
