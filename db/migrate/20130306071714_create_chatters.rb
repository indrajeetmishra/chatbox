class CreateChatters < ActiveRecord::Migration
  def change
    create_table :chatters do |t|
      t.string :name
      t.text :message
      t.integer :user_id

      t.timestamps
    end
  end
end
