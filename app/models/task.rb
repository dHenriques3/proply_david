class Task < ApplicationRecord
  belongs_to :property
  belongs_to :user

  has_many :subtasks
end
