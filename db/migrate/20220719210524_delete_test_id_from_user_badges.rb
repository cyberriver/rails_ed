class DeleteTestIdFromUserBadges < ActiveRecord::Migration[7.0]
  def change
    remove_column :user_badges, :test_id
  end
end
