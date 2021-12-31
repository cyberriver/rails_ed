class CreateAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :answers do |t|
      t.string :title, :limit =>1000, :null=>false, :default =>'PLS ENTER the TITLE'
      t.integer :question_id, :null=>false
      t.boolean :correct, :default=>false

      t.timestamps
    end
    add_index(:answers, :id, unique:true, name: 'by answer id')
    add_foreign_key :answers, :questions
    add_reference :questions, :id
  end
end
