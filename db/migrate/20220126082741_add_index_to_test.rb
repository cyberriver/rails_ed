class AddIndexToTest < ActiveRecord::Migration[7.0]
  def change
    add_index :tests, [:title, :level], unique: true
  end
end
