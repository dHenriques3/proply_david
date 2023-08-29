class Property < ApplicationRecord
  belongs_to :user

  has_one :chatroom

  has_many :tenancies

  has_many :tasks

  validates_presence_of :name, :property_type, :address, :description
end
