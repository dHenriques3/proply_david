class Task < ApplicationRecord
  belongs_to :property
  belongs_to :user

  has_many :subtasks, dependent: :destroy

  validates_presence_of :start_date, :completion_date, :title
end
