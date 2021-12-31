class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name, :limit =>1000, :null=>false, :default => 'pls enter the user name'
      t.string :email, :limit =>500, :null=>false, :default =>'no email provided'

      t.timestamps
    end
    add_index(:users, :id, unique:true, name: 'by user id')
  end
end
