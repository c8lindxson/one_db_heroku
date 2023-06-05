class CreateVerifiImageResults < ActiveRecord::Migration[7.0]
  def change
    create_table :verifi_image_results do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :nudity
      t.float :sexual_activity
      t.float :sexual_display
      t.float :erotica
      t.float :suggestive
      t.float :drugs
      t.float :gore
      t.string :profanity_type
      t.string :profanity_match
      t.string :profanity_intensity
      t.integer :width
      t.integer :height

      t.timestamps
    end
  end
end
