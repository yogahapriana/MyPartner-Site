class CreateRecipients < ActiveRecord::Migration
  def change
    create_table :recipients do |t|
      t.integer :user_id
      t.integer :message_id
      
      t.timestamps
    end
  end
end
