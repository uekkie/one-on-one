class AddSurveyTokenToInvites < ActiveRecord::Migration[5.2]
  def change
    add_column :invites, :survey_token, :string, null: false, default: ''
    add_index :invites, :survey_token, unique: true
  end
end
