class CreateTests < ActiveRecord::Migration[7.0]
  def change
    create_table :tests do |t|
      t.string :title
      t.integer :level
      t.integer :cat_id

      t.timestamps
    end
  end
end
