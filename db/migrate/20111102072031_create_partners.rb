class CreatePartners < ActiveRecord::Migration
  def change
    create_table :partners do |t|
      t.integer :user_id
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :group_id

      t.timestamps
    end
  end
end
