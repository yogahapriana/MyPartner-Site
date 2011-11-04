class RemoveColumnUserId < ActiveRecord::Migration
  def up
    remove_column :partners, :user_id
  end

  def down
    add_column :partners, :user_id
  end
end
