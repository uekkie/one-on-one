class ChangeSchemaToInvites < ActiveRecord::Migration[5.2]
  def up
    # remove_reference :invites, :user, index: true
    remove_foreign_key :invites, :users
    remove_index :invites, :user_id
    remove_reference :invites, :user
  end
  def down
    add_reference :invites, :user, index: true, foreign_key: true
  end
end
