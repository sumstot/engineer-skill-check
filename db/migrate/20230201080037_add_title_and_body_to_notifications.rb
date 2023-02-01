class AddTitleAndBodyToNotifications < ActiveRecord::Migration[6.1]
  def change
    add_column :notifications, :title, :string
    add_column :notifications, :body, :text
  end
end
