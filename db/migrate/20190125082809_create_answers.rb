class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.text :content, null: false
      t.references :answer_board, index: true, foreign_key: true
      t.references :question, index: true, foreign_key: true
      t.timestamps
    end
  end
end
