class AddUserIdToTests < ActiveRecord::Migration[7.0]
  def change
    add_reference :tests, :user, null: false, default: User.find_by(name: 'John Doe').id, foreign_key: true
  end
end
