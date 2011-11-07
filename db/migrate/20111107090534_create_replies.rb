class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.integer :user_id
      t.integer :message_id
      t.timestamps
    end
    remove_column :recipients, :email_recipient
    remove_column :recipients, :username
  end
end
