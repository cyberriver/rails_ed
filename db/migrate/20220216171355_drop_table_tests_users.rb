class DropTableTestsUsers < ActiveRecord::Migration[7.0]
  def up
    drop_table :users_tests, if_exists: true
  end
end
