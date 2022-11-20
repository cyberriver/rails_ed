class AddLastParameterToBadge < ActiveRecord::Migration[7.0]
  def change
    add_column :badges, :parameter, :string
  end
end
