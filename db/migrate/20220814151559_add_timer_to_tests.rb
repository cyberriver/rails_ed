class AddTimerToTests < ActiveRecord::Migration[7.0]
  def up
    add_column :tests, :timer, :integer, default:60
  end

  def down
    remove_columng :tests, :timer
  end
end
