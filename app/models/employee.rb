class Employee < ApplicationRecord

  belongs_to :office
  belongs_to :department
  has_many :profiles
  has_many :notifications, dependent: :destroy


  validates :number, presence: true, uniqueness: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :account, presence: true, uniqueness: true
  validates :password, presence: true

  scope :active, -> {
    where(deleted_at: nil)
  }

  def self.to_csv
    headers = %w[社員番号 氏名 所属]
    attributes = %w[number last_name name]
    CSV.generate(headers: headers) do |csv|
      csv << headers
      all.each do |employee|
        csv << employee.attributes.merge(employee.department.attributes).values_at(*attributes)
      end
    end
  end
end
