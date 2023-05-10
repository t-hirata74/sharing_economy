class UserMobilePhone < ApplicationRecord
  belongs_to :user

  MOBILE_PHONE_REGEXP = /\A0[5789]0[-]?\d{4}[-]?\d{4}\z/

  validates :number, presence: true
  validates :number, format: { with: MOBILE_PHONE_REGEXP }, allow_blank: true
  validates :number, uniqueness: true
  validates :auth_code, presence: true
end
