class CreateAddReferenceTestsToCategories < ActiveRecord::Migration[7.0]
  def change
    add_reference :tests, :category, foreign_key:true
    
  end
end
