class CreateUsersTests < ActiveRecord::Migration[7.0]
  def change
    create_table :users_tests do |t|
      t.references :test, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
