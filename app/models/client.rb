class Client < ActiveRecord::Base
  has_many :target_payment_rules, as: :target, dependent: :destroy
  has_many :payment_rules, through: :target_payment_rules

  validates :identifier, presence: true, uniqueness: true, numericality: true
  validates :name, presence: true, uniqueness: true
  validates :address, presence: true
  validates :phone, presence: true
  validates :country_code, presence: true
  validates :target_payment_rules, length: { minimum: 1 }, rule_limit: true

  def country_name
    ::CountrySelect::COUNTRIES[country_code]
  end
end
