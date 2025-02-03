class CreateNotifications < ActiveRecord::Migration[8.0]
  def change
    create_table :notifications do |t|
      t.string :message
      t.boolean :read, default: 0

      t.timestamps
    end
  end
end
