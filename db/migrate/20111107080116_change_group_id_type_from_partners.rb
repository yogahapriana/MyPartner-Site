class ChangeGroupIdTypeFromPartners < ActiveRecord::Migration
  def up
    remove_column :partners, :group_id
    add_column :partners, :group_id , :integer
  end

  def down
  end
end
