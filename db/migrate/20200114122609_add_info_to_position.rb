class AddInfoToPosition < ActiveRecord::Migration[6.0]
  def change
    add_column :positions, :requirements, :text
    add_column :positions, :responsibilities, :text
  end
end
