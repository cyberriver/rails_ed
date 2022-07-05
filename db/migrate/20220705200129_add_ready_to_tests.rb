class AddReadyToTests < ActiveRecord::Migration[7.0]
  def up
    add_column :tests, :ready, :boolean, default: false
  end

  def down
    remove_column :tests, :ready, :boolean
  end
end
