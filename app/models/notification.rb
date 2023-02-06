class Notification < ApplicationRecord
  belongs_to :employee
  validates :title, presence: true
  validates :body, presence: true
  validates :body, length: { minimum: 30 }, allow_blank: true
end
