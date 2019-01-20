class CreateAnswerBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :answer_boards do |t|
      t.references :user, foreign_key: true
      t.references :member, foreign_key: true

      t.timestamps
    end
  end
end
