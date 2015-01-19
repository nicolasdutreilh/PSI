class Bank < ActiveRecord::Base
  validates :identifier, presence: true, uniqueness: true
  validates :name, presence: true
  validates :address, presence: true
end
