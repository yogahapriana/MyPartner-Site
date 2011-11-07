class AddContentToReplies < ActiveRecord::Migration
  def change
    add_column :replies, :content, :string
  end
end
