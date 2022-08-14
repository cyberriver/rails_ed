class AddParametersToBadge < ActiveRecord::Migration[7.0]
  def up
    add_column :badges, :rule, :string

  end

  def down
    remove_column :badges, :rule
  end
end
