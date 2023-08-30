class Property < ApplicationRecord
  belongs_to :user

  has_one :chatroom

  has_many :tenancies, dependent: :destroy
  has_many :tasks, dependent: :destroy
  has_many :documents, dependent: :destroy

  # for images of the property
  has_many_attached :images

  validates_presence_of :name, :property_type, :address, :description
end
