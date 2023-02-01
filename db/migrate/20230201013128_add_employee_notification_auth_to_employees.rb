class AddEmployeeNotificationAuthToEmployees < ActiveRecord::Migration[6.1]
  def change
    add_column :employees, :employee_notification_auth, :boolean, null: false, default: false
  end
end
