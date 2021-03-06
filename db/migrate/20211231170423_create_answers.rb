class CreateAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :answers do |t|
      t.string :title, limit: 1000, null: false
      t.boolean :correct, default: false
      t.index :id, unique:true, name: 'by answer'
      t.references :question, null: false, foreign_key: true

      t.timestamps
    end

  end
end
