class Chatroom < ApplicationRecord
  belongs_to :property

  # allows us to access all the messages realted to a specific chat room.
  has_many :messages
  # allows us to access all the users related to a chatroom
  has_many :users, through: :messages
end
