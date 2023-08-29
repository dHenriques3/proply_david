class Task < ApplicationRecord
  belongs_to :property
  belongs_to :user

  validates_presence_of :start_date, :completion_date, :title
end
