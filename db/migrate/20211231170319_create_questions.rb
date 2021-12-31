class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.string :body, :limit =>1000, :null=>false, :default =>'pls enter the QUESTION BODY'
      t.integer :test_id, :null=>false

      t.timestamps
    end
    add_index(:questions, [:id, :test_id], unique:true, name: 'by question id and by test_id')
    add_foreign_key :questions, :tests
    add_reference :tests, :id
  end
end
