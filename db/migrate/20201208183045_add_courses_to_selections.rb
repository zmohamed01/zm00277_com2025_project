class AddCoursesToSelections < ActiveRecord::Migration[5.2]
  def change
    add_reference :selections, :course, foreign_key: true
  end
end
