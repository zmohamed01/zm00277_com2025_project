class ChangeSelectionsColumn < ActiveRecord::Migration[5.2]
  def change
    change_column :selections, :created_at, :datetime, null: false
    change_column :selections, :updated_at, :datetime, null: false
  end
end
