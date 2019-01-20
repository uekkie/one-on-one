class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.text :content, null: false, default: ""
      t.references :member, foreign_key: true

      t.timestamps
    end
  end
end
