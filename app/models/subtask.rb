class Subtask < ApplicationRecord
  belongs_to :task

  validates_presence_of :title, :start_date, :completion_date
end
