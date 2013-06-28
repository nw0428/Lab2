class Restaurant < ActiveRecord::Base
  attr_accessible :address, :description, :name, :phone_number
  validates :name, presence: true, length: { minimum: 2}
  validates :description, presence: true, length: { minimum: 5}
  validates :address, presence: true, length: { minimum: 5}
  validates :phone_number, presence: true, length: { minimum: 10}

end
