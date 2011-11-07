class AddUsernameColumnsToRecipient < ActiveRecord::Migration
  def change
    add_column :recipients, :username, :string
  end
end
