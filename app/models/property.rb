class Property < ApplicationRecord
  belongs_to :user

  validates_presence_of :name, :property_type, :address, :description
end
