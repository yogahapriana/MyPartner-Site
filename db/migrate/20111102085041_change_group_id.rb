class ChangeGroupId < ActiveRecord::Migration
  def up
    #change_column :partners, :group_id, :integer
  end

  def down
    change_column :partners, :group_id, :string
  end
end
