require 'bcrypt'

class Employee < ApplicationRecord
  # before_save :downcase_account
  # include BCrypt


  belongs_to :office
  belongs_to :department
  has_many :profiles
  has_many :notifications

  validates :number, presence: true, uniqueness: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :account, presence: true, uniqueness: true
  validates :password, presence: true

  scope :active, -> {
    where(deleted_at: nil)
  }

  # def password
  #   @password ||= Password.new(password_hash)
  # end

  # def password=(new_password)
  #   @password = Password.create(new_password)
  #   self.password_hash = @password
  # end

  # private

  # def downcase_account
  #   self.account = account.downcase
  # end
end
