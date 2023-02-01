class Notification < ApplicationRecord
  belongs_to :employee
  resources only %i[index show ]
end
