class AddLastMessageAtToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :last_message_at, :date
  end
end
