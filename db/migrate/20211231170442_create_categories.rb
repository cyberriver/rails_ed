class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :title, :limit =>1000, :null=>false, :default =>'pls enter the TITLE CATEGORY'

      t.timestamps
    end
    add_index(:categories, :id, unique:true, name: 'by category id')
    add_foreign_key :tests, :categories
    add_reference :categories, :category_id
  end
end
