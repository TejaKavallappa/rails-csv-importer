class Shipping < ActiveRecord::Base
  validates :first_name, :last_name, presence: {message: "Please check if column is present"}
  validates :address, :city, :state, :zip_code, presence: {message: "Please check if column is present"}
end
