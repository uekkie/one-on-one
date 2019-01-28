class CreateAnswerBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :answer_boards do |t|
      t.references :user, index: true, foreign_key: true
      t.references :invite, index: true, foreign_key: true

      t.timestamps
    end
  end
end
