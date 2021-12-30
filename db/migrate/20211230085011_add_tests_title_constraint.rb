class AddTestsTitleConstraint < ActiveRecord::Migration[7.0]
  def change
    change_column_null(:tests,:title,false)
  end
end
