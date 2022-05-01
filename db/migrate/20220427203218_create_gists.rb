class CreateGists < ActiveRecord::Migration[7.0]
  def change
    create_table :gists do |t|

      t.string :gist_url
      t.references :user, foreign_key: true
      t.references :question, foreign_key: true
      t.timestamps
    end
  end
end
