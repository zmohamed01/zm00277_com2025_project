class CreateSelections < ActiveRecord::Migration[5.2]
  def change
    create_table :selections do |t|
      t.string :title
      t.text :reason
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
