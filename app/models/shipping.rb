class Shipping < ActiveRecord::Base
  validates :first_name, :last_name, presence: {message: "can't be blank"}
  validates :address, :city, :state, :zip_code, presence: {message: "can't be blank"}

  validates :last_name, uniqueness: {scope: [:first_name, :address, :city, :state, :zip_code]}
end
