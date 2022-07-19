class CreateBadges < ActiveRecord::Migration[7.0]
  def change
    create_table :badges do |t|
      t.string :title
      t.string :file_name
      t.index :id, unique:true, name: 'by badge'

      t.timestamps
    end
  end
end
