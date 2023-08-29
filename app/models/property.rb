class Property < ApplicationRecord
  belongs_to :user

  has_one :chatroom

  has_many :tenancies
  has_many :documents

  has_many :tasks
  has_many :subtasks, through: :tasks
end
