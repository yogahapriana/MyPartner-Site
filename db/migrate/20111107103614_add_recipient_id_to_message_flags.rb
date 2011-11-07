class AddRecipientIdToMessageFlags < ActiveRecord::Migration
  def change
    add_column :message_flags, :recipient_id, :integer
  end
end
