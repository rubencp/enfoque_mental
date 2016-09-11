class AddHourlyTimestampToUser < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :last_message_at, :datetime
  end
end
