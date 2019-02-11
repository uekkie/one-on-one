class RemoveUserToAnswerBoard < ActiveRecord::Migration[5.2]
  def up
    remove_reference :answer_boards, :user, index: true
  end
  def down
    add_reference :answer_boards, :user, index: true, foreign_key: true
  end
end
