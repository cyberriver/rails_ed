class CreateGists < ActiveRecord::Migration[7.0]
  def change
    create_table :gists do |t|
      t.string :question
      t.string :gist_url
      t.string :email
      
      t.timestamps
    end
  end
end
