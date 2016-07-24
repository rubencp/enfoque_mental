class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :number
      t.integer :message_nr
      t.integer :conversation_nr

      t.timestamps
    end
  end
end
