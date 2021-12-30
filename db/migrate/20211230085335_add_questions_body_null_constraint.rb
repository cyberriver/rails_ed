class AddQuestionsBodyNullConstraint < ActiveRecord::Migration[7.0]
  def change
    change_column_null(:questions,:body,false)
  end
end
