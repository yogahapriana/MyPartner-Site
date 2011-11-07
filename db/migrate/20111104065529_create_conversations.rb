class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.integer :message_id
      t.integer :recipient_id
      t.text :body
      t.integer :attachment_id

      t.timestamps
    end
  end
end
