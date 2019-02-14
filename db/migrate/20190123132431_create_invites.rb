class CreateInvites < ActiveRecord::Migration[5.2]
  def change
    create_table :invites do |t|
      t.references :user, foreign_key: true
      t.references :question_board, foreign_key: true
      t.string :name, null: false
      t.string :email, null: false
      t.string :token, null: false

      t.timestamps
    end
    add_index :invites, :token, unique: true
  end
end
