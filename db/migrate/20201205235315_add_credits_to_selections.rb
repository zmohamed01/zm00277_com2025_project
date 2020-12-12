class AddCreditsToSelections < ActiveRecord::Migration[5.2]
  def change
    add_column :selections, :credits, :integer, default: 15
  end
end
