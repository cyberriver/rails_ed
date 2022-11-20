class CreateTests < ActiveRecord::Migration[7.0]
  def change
    create_table :tests do |t|
      t.string :title, limit: 1000, null: false
      t.integer :level, null: false, default: 0
      

      t.timestamps
    end
  end
end
