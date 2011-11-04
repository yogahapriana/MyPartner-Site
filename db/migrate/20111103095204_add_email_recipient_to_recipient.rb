class AddEmailRecipientToRecipient < ActiveRecord::Migration
  def self.up
    add_column :recipients, :email_recipient, :string
  end

  def self.down
    remove_column :recipients, :email_recipient, :string
  end
end
