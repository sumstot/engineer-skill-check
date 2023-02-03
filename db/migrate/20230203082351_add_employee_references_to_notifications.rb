class AddEmployeeReferencesToNotifications < ActiveRecord::Migration[6.1]
  def change
    add_reference :notifications, :employee, foreign_key: true
  end
end
