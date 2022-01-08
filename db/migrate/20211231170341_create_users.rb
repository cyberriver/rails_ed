class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name, limit: 1000, null: false
      t.string :email, limit: 500, null: false
      t.index :id, unique:true, name: 'by user'

      t.timestamps
    end

  end
end
