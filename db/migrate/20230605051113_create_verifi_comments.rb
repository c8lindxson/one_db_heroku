class CreateVerifiComments < ActiveRecord::Migration[7.0]
  def change
    create_table :verifi_comments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :verifi_post, null: false, foreign_key: true
      t.string :content

      t.timestamps
    end
  end
end
