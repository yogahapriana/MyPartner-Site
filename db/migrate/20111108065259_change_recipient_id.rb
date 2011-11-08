class ChangeRecipientId < ActiveRecord::Migration
  def up
    remove_column :message_flags, :recipient_id
  end

  def down
    add_column :message_flags, :recipient_id, :integer
  end
end
