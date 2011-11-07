class CreateMessageFlags < ActiveRecord::Migration
  def change
    create_table :message_flags do |t|
      t.integer :message_id
      t.integer :user_id
      t.boolean :readed,:default =>false
      t.timestamps
    end
  end
end
