class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :title, null: false, default: ""
      t.references :question_board, index: true, foreign_key: true

      t.timestamps
    end
  end
end
