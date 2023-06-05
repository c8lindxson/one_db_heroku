class CreateVerifiNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :verifi_notifications do |t|
      t.string :title
      t.boolean :unread
      t.references :user, null: false, foreign_key: true
      t.references :verifi_post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
