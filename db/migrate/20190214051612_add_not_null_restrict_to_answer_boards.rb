class AddNotNullRestrictToAnswerBoards < ActiveRecord::Migration[5.2]
  def change
    change_column :answer_boards, :invite_id, :bigint, null: false
  end
end
