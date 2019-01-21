class CreateQuestionBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :question_boards do |t|
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
