class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :title, limit: 1000, null: false
      t.index :id, unique:true, name: 'by category'

      t.timestamps
    end

  end
end
