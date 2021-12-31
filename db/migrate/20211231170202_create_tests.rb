class CreateTests < ActiveRecord::Migration[7.0]
  def change
    create_table :tests do |t|
      t.string :title, :limit =>1000, :null=>false, :default=>'PLS ENTER the TITLE'
      t.integer :level, :null=>false, :default=>0
      t.integer :category_id, :null=>false

      t.timestamps
    end
    add_index(:tests, [:id, :category_id], unique:true, name: 'by id and by category_id')
  end
end
