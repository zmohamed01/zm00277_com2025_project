class AddApprovedToSelections < ActiveRecord::Migration[5.2]
  def change
    add_column :selections, :approved, :boolean, default: false
  end
end
